import 'package:diiket/data/network/product_service.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// predefined category
// ignore: avoid_classes_with_only_static_members
abstract class ProductFamily {
  static const String all = 'all';
  static const String popular = 'popular';
  static const String random = 'random';
  static const String recommended = 'recommended';

  // preserved sections
  static const productSections = [popular, random, recommended];
  // sections that requrie auth
  static const requireAuthSections = [recommended];
}

final productProvider = StateNotifierProvider.family<ProductState,
    AsyncValue<PaginatedProducts>, ProductProviderDetail>(
  (ref, detail) {
    // perlu watch karena productService bergantung ke active Market
    return ProductState(ref.watch(productServiceProvider).state, detail);
  },
);

class ProductState extends StateNotifier<AsyncValue<PaginatedProducts>> {
  final ProductProviderDetail _detail;
  final ProductService _productService;

  ProductState(this._productService, this._detail)
      : super(const AsyncValue.loading()) {
    loadProducts();
  }

  Future<PaginatedProducts> _getProductAtPage([int page = 1]) async {
    // fetch product by provided category
    switch (_detail.source) {
      case ProductSourceType.category:
        return _getProductByCategory(_detail.query, page);
      case ProductSourceType.scenario:
        return _getProductByScenario(_detail.query, page, _detail.limit);
    }
  }

  Future<PaginatedProducts> _getProductByCategory(String category, int page) {
    if (category == ProductFamily.all) {
      return _productService.getAllProducts(page: page);
    }

    if (ProductFamily.productSections.contains(category)) {
      return _productService.getProductSection(category, page);
    }

    return _productService.getAllProducts(
      page: page,
      category: category,
    );
  }

  Future<PaginatedProducts> _getProductByScenario(String scenario, int page,
      [
    int? limit,
  ]) {
    return _productService.getProductScenario(scenario, page, limit);
  }

  Future<void> loadProducts() async {
    state = const AsyncValue.loading();

    try {
      final PaginatedProducts products = await _getProductAtPage();

      if (mounted) state = AsyncValue.data(products);
    } on CustomException catch (error) {
      if (mounted) state = AsyncValue.error(error);
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
        return loadProducts();
      }

      final int? nextPage = this.nextPage;

      if (nextPage != null) {
        final PaginatedProducts result = await _getProductAtPage(nextPage);

        state = AsyncValue.data(result.copyWith(data: [
          ...?currentState!.data,
          ...?result.data,
            ],
          ),
        );
      }
    } on CustomException catch (error) {
      state = AsyncValue.error(error);
    }
  }
}
