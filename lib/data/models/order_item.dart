import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
class OrderItem with _$OrderItem {
  factory OrderItem({
    int? id,
    int? order_id,
    int? product_id,
    String? payment_status,
    String? status,
    String? notes,
    Product? product,
    int? quantity,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}
