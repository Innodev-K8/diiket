// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stall _$_$_StallFromJson(Map<String, dynamic> json) {
  return _$_Stall(
    id: json['id'] as int?,
    seller: json['seller'] == null
        ? null
        : Seller.fromJson(json['seller'] as Map<String, dynamic>),
    marketId: json['marketId'] as int?,
    isOpen: json['isOpen'] as bool?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    photo: json['photo'] as String?,
    locationBlock: json['locationBlock'] as String?,
    locationNumber: json['locationNumber'] as String?,
    locationFloor: json['locationFloor'] as String?,
    locationDetail: json['locationDetail'] as String?,
    locationLat: json['locationLat'] as String?,
    locationLng: json['locationLng'] as String?,
    verifiedAt: json['verifiedAt'] as int?,
  );
}

Map<String, dynamic> _$_$_StallToJson(_$_Stall instance) => <String, dynamic>{
      'id': instance.id,
      'seller': instance.seller,
      'marketId': instance.marketId,
      'isOpen': instance.isOpen,
      'name': instance.name,
      'description': instance.description,
      'photo': instance.photo,
      'locationBlock': instance.locationBlock,
      'locationNumber': instance.locationNumber,
      'locationFloor': instance.locationFloor,
      'locationDetail': instance.locationDetail,
      'locationLat': instance.locationLat,
      'locationLng': instance.locationLng,
      'verifiedAt': instance.verifiedAt,
    };
