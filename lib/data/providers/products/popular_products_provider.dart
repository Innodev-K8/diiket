import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/network/product_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productProvider = StateNotifierProvider.family<ProductState,
    AsyncValue<List<Product>>, String>(
  (ref, category) {
    // perlu watch karena productService bergantung ke active Market
    return ProductState(ref.watch(productServiceProvider).state, category);
  },
);

class ProductState extends StateNotifier<AsyncValue<List<Product>>> {
  // ignore: unused_field
  final String _category;
  final ProductService _productService;

  ProductState(this._productService, this._category)
      : super(AsyncValue.loading()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    state = AsyncValue.loading();

    try {
      // ignore: todo
      // TODO: fetch products berdasarkan _category
      List<Product> products = await _productService.getAllProducts();

      state = AsyncValue.data(products);
    } on CustomException catch (error) {
      state = AsyncValue.error(error);
    }
  }
}
