// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_detaill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DriverDetaill _$_$_DriverDetaillFromJson(Map<String, dynamic> json) {
  return _$_DriverDetaill(
    id: json['id'] as int?,
    user_id: json['user_id'] as int?,
    market_id: json['market_id'] as int?,
    verified_at: json['verified_at'] as int?,
    vehicle_name: json['vehicle_name'] as String?,
    vehicle_number: json['vehicle_number'] as String?,
  );
}

Map<String, dynamic> _$_$_DriverDetaillToJson(_$_DriverDetaill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'market_id': instance.market_id,
      'verified_at': instance.verified_at,
      'vehicle_name': instance.vehicle_name,
      'vehicle_number': instance.vehicle_number,
    };
