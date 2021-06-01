import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/stall.dart';
import 'package:diiket/data/network/stall_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stallDetailProvider =
    StateNotifierProvider.family<StallDetailState, AsyncValue<Stall>, int>(
  (ref, stallId) {
    // perlu watch karena stallServiceProvider bergantung ke active Market
    return StallDetailState(ref.watch(stallServiceProvider).state, stallId);
  },
);

class StallDetailState extends StateNotifier<AsyncValue<Stall>> {
  final StallService _stallService;
  final int _stallId;

  StallDetailState(this._stallService, this._stallId)
      : super(AsyncValue.loading()) {
    loadStall();
  }

  Future<void> loadStall() async {
    state = AsyncValue.loading();

    return reLoadStall();
  }

  Future<void> reLoadStall() async {
    try {
      Stall stalls = await _stallService.getStallDetail(_stallId);

      state = AsyncValue.data(stalls);
    } on CustomException catch (error) {
      state = AsyncValue.error(error);
    }
  }
}
