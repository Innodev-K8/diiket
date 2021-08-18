import 'package:diiket/data/network/api_service.dart';
import 'package:diiket/data/network/product_service.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late Dio dio;
  late ProductService productService;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    dio = ApiService.create();
    productService = ProductService(dio, 1);
  });

  test('Product Service should get all products', () async {
    final result = await productService.getAllProducts();

    expect(result, isNotNull);
    expect(result, isA<PaginatedProducts>());
  });
}
