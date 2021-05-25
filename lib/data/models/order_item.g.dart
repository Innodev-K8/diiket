// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderItem _$_$_OrderItemFromJson(Map<String, dynamic> json) {
  return _$_OrderItem(
    id: json['id'] as int?,
    order_id: json['order_id'] as int?,
    product_id: json['product_id'] as int?,
    payment_status: json['payment_status'] as String?,
    status: json['status'] as String?,
    notes: json['notes'] as String?,
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    quantity: json['quantity'] as int?,
  );
}

Map<String, dynamic> _$_$_OrderItemToJson(_$_OrderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.order_id,
      'product_id': instance.product_id,
      'payment_status': instance.payment_status,
      'status': instance.status,
      'notes': instance.notes,
      'product': instance.product,
      'quantity': instance.quantity,
    };
