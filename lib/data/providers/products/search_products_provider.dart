import 'package:diiket/data/network/product_service.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/data/providers/products/products_search_history_provider.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchProductsProvider =
    StateNotifierProvider<SearchProductsState, AsyncValue<PaginatedProducts>>(
        (ref) {
  return SearchProductsState(ref.watch(productServiceProvider).state, ref.read);
});

class SearchProductsState extends StateNotifier<AsyncValue<PaginatedProducts>> {
  final ProductService _productService;
  final Reader _read;

  String? query;

  SearchProductsState(this._productService, this._read)
      : super(
          AsyncValue.data(PaginatedProducts(data: [])),
        );

  void clear() {
    state = AsyncValue.data(PaginatedProducts(data: []));
  }

  Future<void> searchProducts(String? q) async {
    state = const AsyncValue.loading();

    try {
      query = q;

      if (query != null && query != '') {
        _read(productSearchHistoryProvider.notifier).add(query!);
      }

      final PaginatedProducts products =
          await _productService.searchProducs(1, query);

      _read(analyticsProvider).logSearch(searchTerm: query!);

      if (mounted) state = AsyncValue.data(products);
    } on CustomException catch (error) {
      state = AsyncValue.error(error);
    }
  }

  int? get nextPage {
    final PaginatedProducts? currentState = state.data?.value;

    if (currentState?.meta?.current_page == null ||
        currentState?.meta?.last_page == null) return null;

    final int nextPage = currentState!.meta!.current_page! + 1;
    final int lastPage = currentState.meta!.last_page!;

    return nextPage <= lastPage ? nextPage : null;
  }

  Future<void> loadMore() async {
    try {
      final PaginatedProducts? currentState = state.data?.value;

      if (state.data?.value == null) {
        return searchProducts(query);
      }

      final int? nextPage = this.nextPage;

      if (nextPage != null) {
        final PaginatedProducts result =
            await _productService.searchProducs(nextPage, query);

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
