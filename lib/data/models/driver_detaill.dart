import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_detaill.freezed.dart';
part 'driver_detaill.g.dart';

@freezed
class DriverDetaill with _$DriverDetaill {
  factory DriverDetaill({
    int? id,
    int? user_id,
    int? market_id,
    int? verified_at,
    String? vehicle_name,
    String? vehicle_number,
  }) = _DriverDetaill;

  factory DriverDetaill.fromJson(Map<String, dynamic> json) =>
      _$DriverDetaillFromJson(json);
}
