import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/stall.dart';
import 'package:dio/dio.dart';

class StallService {
  Dio _dio;
  int _marketId;

  StallService(this._dio, this._marketId);

  String _(Object path) => '/user/markets/${_marketId}/stalls/$path';

  Future<List<Stall>> getAllStalls() async {
    try {
      final response = await _dio.get(_(''));

      List<dynamic> results = response.data['data'];

      return results.map((json) => Stall.fromJson(json)).toList();
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<Stall> getStallDetail(int id) async {
    try {
      final response = await _dio.get(_(id));

      return Stall.fromJson(response.data['data']);
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
