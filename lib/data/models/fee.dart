import 'package:freezed_annotation/freezed_annotation.dart';

part 'fee.freezed.dart';
part 'fee.g.dart';

@freezed
class Fee with _$Fee {
  factory Fee({
    int? delivery_fee,
    int? pickup_fee,
    int? service_fee,
    int? total_fee,
  }) = _Fee;

  factory Fee.fromJson(Map<String, dynamic> json) => _$FeeFromJson(json);
}
