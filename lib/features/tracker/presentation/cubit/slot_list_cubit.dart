import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';
import 'package:heuser_erp_mobile/core/network/result.dart';
import 'package:heuser_erp_mobile/features/tracker/domain/slot_days.dart';

part 'slot_list_cubit.freezed.dart';

/// Bookable times for one picker.
@freezed
sealed class SlotListState with _$SlotListState {
  /// Fetching.
  const factory SlotListState.loading() = SlotListLoading;

  /// Loaded (possibly empty).
  const factory SlotListState.loaded(List<SlotItem> items) = SlotListLoaded;

  /// Failed.
  const factory SlotListState.failed(Failure failure) = SlotListFailed;
}

/// Loads interview times or trial sessions through [_load]. Created lazily
/// by the widget that shows the picker, so nothing is fetched until a time
/// can actually be booked.
class SlotListCubit extends Cubit<SlotListState> {
  /// Creates the cubit and starts loading.
  SlotListCubit(this._load) : super(const SlotListState.loading()) {
    unawaited(load());
  }

  final Future<Result<List<SlotItem>>> Function() _load;

  /// Loads (or reloads).
  Future<void> load() async {
    emit(const SlotListState.loading());
    final r = await _load();
    if (isClosed) return;
    r.fold(
      (f) => emit(SlotListState.failed(f)),
      (items) => emit(SlotListState.loaded(items)),
    );
  }
}
