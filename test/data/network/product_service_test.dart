import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/network/api_service.dart';
import 'package:diiket/data/network/product_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Dio dio;
  late ProductService productService;

  setUp(() {
    dio = ApiService.create();
    productService = ProductService(dio, 1);
  });

  test('Product Service should get all products', () async {
    final result = await productService.getAllProducts();

    expect(result, isA<List<Product>>());
  });
}
