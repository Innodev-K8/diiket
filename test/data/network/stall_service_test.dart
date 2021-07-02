import 'package:diiket/data/models/paginated/paginated_stalls.dart';
import 'package:diiket/data/models/stall.dart';
import 'package:diiket/data/network/api_service.dart';
import 'package:diiket/data/network/stall_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Dio dio;
  late StallService stallService;

  setUp(() {
    dio = ApiService.create();
    stallService = StallService(dio, 1);
  });

  test('Stall Service should get all stalls', () async {
    final result = await stallService.getStalls();

    expect(result, isNotNull);
    expect(result, isA<PaginatedStalls>());
  });

  test('Stall Service should get stall detail', () async {
    final result = await stallService.getStallDetail(1);

    expect(result, isNotNull);
    expect(result, isA<Stall>());
    expect(result.products, isNotEmpty);
  });
}
