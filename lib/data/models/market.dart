import 'package:freezed_annotation/freezed_annotation.dart';

part 'market.freezed.dart';
part 'market.g.dart';

@freezed
abstract class Market with _$Market {
  const factory Market({
    int? id,
    String? name,
    String? address,
    @JsonKey(name: 'location_lat') String? locationLat,
    @JsonKey(name: 'location_lng') String? locationLng,
    @JsonKey(name: 'responsible_person_name') String? responsiblePersonName,
    @JsonKey(name: 'responsible_person_contact')
        String? responsiblePersonContact,
    @JsonKey(name: 'field_merchant_count') int? fieldMerchantCount,
    double? distance,
  }) = _Market;

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);
}
