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
    stream_chat_channel: json['stream_chat_channel'] as String?,
    driver: json['driver'] == null
        ? null
        : User.fromJson(json['driver'] as Map<String, dynamic>),
    status: json['status'] as String?,
    address: json['address'] as String?,
    location_lat: json['location_lat'] as String?,
    location_lng: json['location_lng'] as String?,
    delivery_distance: json['delivery_distance'] as int?,
    total_weight: json['total_weight'] as int?,
    products_price: json['products_price'] as int?,
    delivery_fee: json['delivery_fee'] as int?,
    pickup_fee: json['pickup_fee'] as int?,
    service_fee: json['service_fee'] as int?,
    total_price: json['total_price'] as int?,
    order_items: (json['order_items'] as List<dynamic>?)
        ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    confirmed_at: dateTimeFromString(json['confirmed_at'] as String?),
    confirmed_by_driver_at:
        dateTimeFromString(json['confirmed_by_driver_at'] as String?),
    purchase_completed_at:
        dateTimeFromString(json['purchase_completed_at'] as String?),
    completed_at: dateTimeFromString(json['completed_at'] as String?),
    canceled_at: dateTimeFromString(json['canceled_at'] as String?),
  );
}

Map<String, dynamic> _$_$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'market_id': instance.market_id,
      'user_id': instance.user_id,
      'driver_id': instance.driver_id,
      'stream_chat_channel': instance.stream_chat_channel,
      'driver': instance.driver?.toJson(),
      'status': instance.status,
      'address': instance.address,
      'location_lat': instance.location_lat,
      'location_lng': instance.location_lng,
      'delivery_distance': instance.delivery_distance,
      'total_weight': instance.total_weight,
      'products_price': instance.products_price,
      'delivery_fee': instance.delivery_fee,
      'pickup_fee': instance.pickup_fee,
      'service_fee': instance.service_fee,
      'total_price': instance.total_price,
      'order_items': instance.order_items?.map((e) => e.toJson()).toList(),
      'confirmed_at': instance.confirmed_at?.toIso8601String(),
      'confirmed_by_driver_at':
          instance.confirmed_by_driver_at?.toIso8601String(),
      'purchase_completed_at':
          instance.purchase_completed_at?.toIso8601String(),
      'completed_at': instance.completed_at?.toIso8601String(),
      'canceled_at': instance.canceled_at?.toIso8601String(),
    };
