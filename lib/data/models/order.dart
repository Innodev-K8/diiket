import 'package:diiket/data/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_item.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  factory Order({
    int? id,
    int? market_id,
    int? user_id,
    int? driver_id,
    User? driver,
    String? status,
    String? address,
    String? location_lat,
    String? location_lng,
    int? total_weight,
    int? products_price,
    int? delivery_fee,
    int? pickup_fee,
    int? service_fee,
    int? total_price,
    List<OrderItem>? order_items,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
