import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/stall.dart';
import 'package:diiket/data/network/stall_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stallDetailProvider =
    StateNotifierProvider.family<StallDetailState, AsyncValue<Stall>, int>(
  (ref, stallId) {
    // // perlu watch karena stallServiceProvider bergantung ke active Market
    // ref.watch(stallServiceProvider);

    return StallDetailState(ref.read, stallId);
  },
);

class StallDetailState extends StateNotifier<AsyncValue<Stall>> {
  final Reader _read;
  final int _stallId;

  StallDetailState(this._read, this._stallId)
      : super(const AsyncValue.loading()) {
    loadStall();
  }

  Future<void> loadStall() async {
    state = const AsyncValue.loading();

    return reloadStall();
  }

  Future<void> reloadStall() async {
    try {
      final Stall stalls =
          await _read(stallServiceProvider).state.getStallDetail(_stallId);

      state = AsyncValue.data(stalls);
    } on CustomException catch (error) {
      state = AsyncValue.error(error);
    }
  }
}
