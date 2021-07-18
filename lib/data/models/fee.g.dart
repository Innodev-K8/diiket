// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Fee _$_$_FeeFromJson(Map<String, dynamic> json) {
  return _$_Fee(
    delivery_fee: json['delivery_fee'] as int?,
    pickup_fee: json['pickup_fee'] as int?,
    service_fee: json['service_fee'] as int?,
    total_fee: json['total_fee'] as int?,
  );
}

Map<String, dynamic> _$_$_FeeToJson(_$_Fee instance) => <String, dynamic>{
      'delivery_fee': instance.delivery_fee,
      'pickup_fee': instance.pickup_fee,
      'service_fee': instance.service_fee,
      'total_fee': instance.total_fee,
    };
