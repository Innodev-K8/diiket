import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diiket/helpers/casting_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
class OrderItem with _$OrderItem {
  factory OrderItem({
    int? id,
    String? firebase_cart_id,
    int? order_id,
    int? product_id,
    String? payment_status,
    String? status,
    String? notes,
    Product? product,
    int? quantity,
  }) = _OrderItem;

  // ignore: unused_element
  const OrderItem._();

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  factory OrderItem.fromSnapshot(DocumentSnapshot<Object?> snapshot) {
    return OrderItem.fromJson(
      castOrFallback(snapshot.data(), {}),
    ).copyWith(firebase_cart_id: snapshot.id);
  }
}
