import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/application.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';

part 'application_load_cubit.freezed.dart';

/// Loading one application for its page.
@freezed
sealed class ApplicationLoadState with _$ApplicationLoadState {
  /// Fetching.
  const factory ApplicationLoadState.loading() = ApplicationLoading;

  /// Loaded.
  const factory ApplicationLoadState.loaded(Application application) =
      ApplicationLoaded;

  /// Failed.
  const factory ApplicationLoadState.failed(Failure failure) =
      ApplicationLoadFailed;
}

/// Fetches one application by id; the page then hands it to the form bloc
/// or the tracker.
class ApplicationLoadCubit extends Cubit<ApplicationLoadState> {
  /// Creates the cubit and loads [id].
  ApplicationLoadCubit(this._repo, this.id, {Application? initial})
    : super(
        initial != null
            ? ApplicationLoadState.loaded(initial)
            : const ApplicationLoadState.loading(),
      ) {
    if (initial == null) unawaited(load());
  }

  final IntakeRepository _repo;

  /// The application id.
  final int id;

  /// Loads (or reloads).
  Future<void> load() async {
    emit(const ApplicationLoadState.loading());
    final r = await _repo.fetch(id);
    if (isClosed) return;
    r.fold(
      (f) => emit(ApplicationLoadState.failed(f)),
      (a) => emit(ApplicationLoadState.loaded(a)),
    );
  }

  /// Replaces the loaded application (after a save or upload).
  void replace(Application a) => emit(ApplicationLoadState.loaded(a));
}
