import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/paginated/paginated_products.dart';
import 'package:diiket/data/network/product_service.dart';
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
    AsyncValue<PaginatedProducts>, String>(
  (ref, category) {
    // perlu watch karena productService bergantung ke active Market
    return ProductState(ref.watch(productServiceProvider).state, category);
  },
);

class ProductState extends StateNotifier<AsyncValue<PaginatedProducts>> {
  final String _category;
  final ProductService _productService;

  ProductState(this._productService, this._category)
      : super(const AsyncValue.loading()) {
    loadProducts();
  }

  Future<PaginatedProducts> _getProductAtPage([int page = 1]) async {
    // fetch product by provided category
    if (_category == ProductFamily.all) {
      return _productService.getAllProducts(page);
    }

    if (ProductFamily.productSections.contains(_category)) {
      return _productService.getProductSection(_category, page);
    }

    return _productService.getAllProducts(page, _category);
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
        ]));
      }
    } on CustomException catch (error) {
      state = AsyncValue.error(error);
    }
  }
}
