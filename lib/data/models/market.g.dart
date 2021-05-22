// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Market _$_$_MarketFromJson(Map<String, dynamic> json) {
  return _$_Market(
    id: json['id'] as int?,
    name: json['name'] as String?,
    address: json['address'] as String?,
    locationLat: json['location_lat'] as String?,
    locationLng: json['location_lng'] as String?,
    responsiblePersonName: json['responsible_person_name'] as String?,
    responsiblePersonContact: json['responsible_person_contact'] as String?,
    fieldMerchantCount: json['field_merchant_count'] as int?,
  );
}

Map<String, dynamic> _$_$_MarketToJson(_$_Market instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'location_lat': instance.locationLat,
      'location_lng': instance.locationLng,
      'responsible_person_name': instance.responsiblePersonName,
      'responsible_person_contact': instance.responsiblePersonContact,
      'field_merchant_count': instance.fieldMerchantCount,
    };
