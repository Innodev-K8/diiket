import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/paginated/paginated_stalls.dart';
import 'package:diiket/data/network/stall_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stallProvider =
    StateNotifierProvider<StallState, AsyncValue<PaginatedStalls>>(
  (ref) {
    // perlu watch karena stallServiceProvider bergantung ke active Market
    return StallState(ref.watch(stallServiceProvider).state);
  },
);

class StallState extends StateNotifier<AsyncValue<PaginatedStalls>> {
  final StallService _stallService;

  StallState(this._stallService) : super(AsyncValue.loading()) {
    loadStalls();
  }

  Future<void> loadStalls() async {
    state = AsyncValue.loading();

    try {
      PaginatedStalls stalls = await _stallService.getStalls(1);

      state = AsyncValue.data(stalls);
    } on CustomException catch (error) {
      state = AsyncValue.error(error);
    }
  }

  int? get nextPage {
    final PaginatedStalls? currentState = state.data?.value;

    if (currentState?.meta?.current_page == null ||
        currentState?.meta?.last_page == null) return null;

    final int nextPage = currentState!.meta!.current_page! + 1;
    final int lastPage = currentState.meta!.last_page!;

    return nextPage <= lastPage ? nextPage : null;
  }

  Future<void> loadMore() async {
    try {
      final PaginatedStalls? currentState = state.data?.value;

      if (state.data?.value == null) {
        return loadStalls();
      }

      final int? nextPage = this.nextPage;

      if (nextPage != null) {
        PaginatedStalls result = await _stallService.getStalls(nextPage);

        state = AsyncValue.data(result.copyWith(data: [
          ...?currentState!.data,
          ...?result.data,
        ]));
      }
    } on CustomException catch (error) {
      state = AsyncValue.error(error);
    }
  }
}
