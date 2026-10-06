import 'dart:ui' show Brightness;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/app/theme/theme_preference.dart';
import 'package:heuser_erp_mobile/app/theme/theme_preference_store.dart';
import 'package:heuser_erp_mobile/app/theme/theme_resolver.dart';

/// Where the remote policy in [ThemeState] came from.
enum ThemeSource {
  /// Built-in defaults (nothing cached, nothing fetched yet).
  defaults,

  /// The last policy persisted locally.
  cache,

  /// Fresh from `GET /api/v1/site-branding/`.
  network,
}

/// Inputs and the resolved output of the theme.
class ThemeState extends Equatable {
  /// Creates a state.
  const ThemeState({
    required this.remote,
    required this.pref,
    required this.platform,
    required this.reduceMotion,
    required this.source,
    required this.resolved,
  });

  /// Initial state: defaults, light, motion on.
  factory ThemeState.initial({
    Brightness platform = Brightness.light,
    bool reduceMotion = false,
  }) => ThemeState._resolve(
    remote: MobileTheme.defaults,
    pref: ThemePreference.none,
    platform: platform,
    reduceMotion: reduceMotion,
    source: ThemeSource.defaults,
  );

  factory ThemeState._resolve({
    required MobileTheme remote,
    required ThemePreference pref,
    required Brightness platform,
    required bool reduceMotion,
    required ThemeSource source,
  }) => ThemeState(
    remote: remote,
    pref: pref,
    platform: platform,
    reduceMotion: reduceMotion,
    source: source,
    resolved: resolveTheme(
      remote: remote,
      pref: pref,
      platform: platform,
      reduceMotion: reduceMotion,
    ),
  );

  /// Admin policy.
  final MobileTheme remote;

  /// User preference.
  final ThemePreference pref;

  /// OS brightness.
  final Brightness platform;

  /// OS reduce-motion flag.
  final bool reduceMotion;

  /// Provenance of [remote].
  final ThemeSource source;

  /// What to render.
  final ResolvedTheme resolved;

  /// Shortcut to the theme data.
  HThemeData get data => resolved.data;

  ThemeState _with({
    MobileTheme? remote,
    ThemePreference? pref,
    Brightness? platform,
    bool? reduceMotion,
    ThemeSource? source,
  }) => ThemeState._resolve(
    remote: remote ?? this.remote,
    pref: pref ?? this.pref,
    platform: platform ?? this.platform,
    reduceMotion: reduceMotion ?? this.reduceMotion,
    source: source ?? this.source,
  );

  @override
  List<Object?> get props => [
    remote.activePreset,
    remote.allowUserOverride,
    remote.presets.map((p) => p.id).toList(),
    pref,
    platform,
    reduceMotion,
    source,
    resolved,
  ];
}

/// Owns theme resolution. Reads the cached policy and the user preference
/// synchronously-ish at start (no network wait), accepts a fresh policy from
/// the branding repository whenever one arrives, and persists user choices.
class ThemeCubit extends Cubit<ThemeState> {
  /// Creates the cubit.
  ThemeCubit(
    this._store, {
    Brightness platform = Brightness.light,
    bool reduceMotion = false,
  }) : super(
         ThemeState.initial(platform: platform, reduceMotion: reduceMotion),
       );

  final ThemePreferenceStore _store;

  /// Loads the cached policy and the user preference.
  Future<void> start() async {
    final pref = await _store.readPreference();
    final cached = await _store.readCachedRemote();
    if (isClosed) return;
    emit(
      state._with(
        pref: pref,
        remote: cached == null
            ? MobileTheme.defaults
            : MobileThemeCodec.decode(cached),
        source: cached == null ? ThemeSource.defaults : ThemeSource.cache,
      ),
    );
  }

  /// A fresh `mobile_theme` block from the backend (raw JSON, decoded here).
  Future<void> remoteUpdated(Object? json) async {
    emit(
      state._with(
        remote: MobileThemeCodec.decode(json),
        source: ThemeSource.network,
      ),
    );
    await _store.writeCachedRemote(json);
  }

  /// OS brightness / accessibility changed.
  void platformChanged({Brightness? platform, bool? reduceMotion}) =>
      emit(state._with(platform: platform, reduceMotion: reduceMotion));

  /// User picked a preset (`null` = back to the admin's choice).
  Future<void> choosePreset(String? id) async {
    final pref = state.pref.copyWith(presetId: id, clearPreset: id == null);
    emit(state._with(pref: pref));
    await _store.writePreference(pref);
  }

  /// User picked a colour mode.
  Future<void> chooseMode(HThemeMode mode) async {
    final pref = state.pref.copyWith(mode: mode);
    emit(state._with(pref: pref));
    await _store.writePreference(pref);
  }
}
