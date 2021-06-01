// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fare.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Fare _$_$_FareFromJson(Map<String, dynamic> json) {
  return _$_Fare(
    delivery_fee: json['delivery_fee'] as int?,
    pickup_fee: json['pickup_fee'] as int?,
    service_fee: json['service_fee'] as int?,
    total_fee: json['total_fee'] as int?,
  );
}

Map<String, dynamic> _$_$_FareToJson(_$_Fare instance) => <String, dynamic>{
      'delivery_fee': instance.delivery_fee,
      'pickup_fee': instance.pickup_fee,
      'service_fee': instance.service_fee,
      'total_fee': instance.total_fee,
    };
