import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/paginated/paginated_stalls.dart';
import 'package:diiket/data/network/stall_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stallsProvider =
    StateNotifierProvider<StallsState, AsyncValue<PaginatedStalls>>(
  (ref) {
    // perlu watch karena stallServiceProvider bergantung ke active Market
    return StallsState(ref.watch(stallServiceProvider).state);
  },
);

class StallsState extends StateNotifier<AsyncValue<PaginatedStalls>> {
  final StallService _stallService;

  StallsState(this._stallService) : super(const AsyncValue.loading()) {
    loadStalls();
  }

  Future<void> loadStalls() async {
    state = const AsyncValue.loading();

    try {
      final PaginatedStalls stalls = await _stallService.getStalls();

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
        final PaginatedStalls result = await _stallService.getStalls(nextPage);

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
