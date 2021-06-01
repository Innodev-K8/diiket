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
    market_id: json['market_id'] as int?,
    is_open: json['is_open'] as bool?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    photo_url: json['photo_url'] as String?,
    products: (json['products'] as List<dynamic>?)
        ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
    location_block: json['location_block'] as String?,
    location_number: json['location_number'] as String?,
    location_floor: json['location_floor'] as String?,
    location_detail: json['location_detail'] as String?,
    location_lat: json['location_lat'] as String?,
    location_lng: json['location_lng'] as String?,
    verified_at: json['verified_at'] as int?,
  );
}

Map<String, dynamic> _$_$_StallToJson(_$_Stall instance) => <String, dynamic>{
      'id': instance.id,
      'seller': instance.seller,
      'market_id': instance.market_id,
      'is_open': instance.is_open,
      'name': instance.name,
      'description': instance.description,
      'photo_url': instance.photo_url,
      'products': instance.products,
      'location_block': instance.location_block,
      'location_number': instance.location_number,
      'location_floor': instance.location_floor,
      'location_detail': instance.location_detail,
      'location_lat': instance.location_lat,
      'location_lng': instance.location_lng,
      'verified_at': instance.verified_at,
    };
