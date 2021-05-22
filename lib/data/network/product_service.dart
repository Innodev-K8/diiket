import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/product.dart';
import 'package:dio/dio.dart';

class ProductService {
  Dio _dio;
  int _marketId;

  ProductService(this._dio, this._marketId);

  String _(Object path) => '/user/markets/${_marketId}/$path';

  Future<List<Product>> getAllProducts() async {
    try {
      final response = await _dio.get(_('products'));

      List<dynamic> results = response.data['data'];

      return results.map((json) => Product.fromJson(json)).toList();
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  // TODO: add getPopularProducts, etc...
}
