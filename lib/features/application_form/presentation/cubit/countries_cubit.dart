import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heuser_erp_mobile/core/geo/country_order.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/form_options.dart';
import 'package:heuser_erp_mobile/features/applications/domain/intake_repository.dart';

/// Countries for the pickers, in the shared order (Pakistan, US, UK, Canada,
/// the Gulf, then A–Z). Empty until loaded; a failed load keeps the ISO code
/// as the display name, so the form still works offline.
class CountriesCubit extends Cubit<List<Country>> {
  /// Creates the cubit and starts loading.
  CountriesCubit(this._repo) : super(const []) {
    unawaited(load());
  }

  final IntakeRepository _repo;

  /// Loads (or reloads) the list.
  Future<void> load() async {
    final r = await _repo.countries();
    if (isClosed) return;
    r.fold(
      (_) {},
      (list) => emit(CountryOrder.sort(list, (c) => c.code, (c) => c.name)),
    );
  }

  /// Display name for [code].
  String nameOf(String code) =>
      state.where((c) => c.code == code).firstOrNull?.name ?? code;

  /// Countries other than Pakistan (a second nationality).
  List<Country> get others =>
      state.where((c) => c.code != CountryOrder.defaultCountry).toList();
}
