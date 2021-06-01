import 'package:freezed_annotation/freezed_annotation.dart';

part 'fare.freezed.dart';
part 'fare.g.dart';

@freezed
class Fare with _$Fare {
  factory Fare({
    int? delivery_fee,
    int? pickup_fee,
    int? service_fee,
    int? total_fee,
  }) = _Fare;

  factory Fare.fromJson(Map<String, dynamic> json) => _$FareFromJson(json);
}
