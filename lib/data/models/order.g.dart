// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$_$_OrderFromJson(Map<String, dynamic> json) {
  return _$_Order(
    id: json['id'] as int?,
    market_id: json['market_id'] as int?,
    user_id: json['user_id'] as int?,
    driver_id: json['driver_id'] as int?,
    status: json['status'] as String?,
    address: json['address'] as String?,
    location_lat: json['location_lat'] as String?,
    location_lng: json['location_lng'] as String?,
    total_weight: json['total_weight'] as int?,
    products_price: json['products_price'] as int?,
    delivery_price: json['delivery_price'] as int?,
    total_price: json['total_price'] as int?,
    order_items: (json['order_items'] as List<dynamic>?)
        ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'market_id': instance.market_id,
      'user_id': instance.user_id,
      'driver_id': instance.driver_id,
      'status': instance.status,
      'address': instance.address,
      'location_lat': instance.location_lat,
      'location_lng': instance.location_lng,
      'total_weight': instance.total_weight,
      'products_price': instance.products_price,
      'delivery_price': instance.delivery_price,
      'total_price': instance.total_price,
      'order_items': instance.order_items,
    };
