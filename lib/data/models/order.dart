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
    String? stream_chat_channel,
    User? driver,
    String? status,
    String? address,
    String? location_lat,
    String? location_lng,
    int? delivery_distance,
    int? total_weight,
    int? products_price,
    int? delivery_fee,
    int? pickup_fee,
    int? service_fee,
    int? total_price,
    List<OrderItem>? order_items,
    @JsonKey(fromJson: dateTimeFromString) DateTime? confirmed_at,
    @JsonKey(fromJson: dateTimeFromString) DateTime? confirmed_by_driver_at,
    @JsonKey(fromJson: dateTimeFromString) DateTime? purchase_completed_at,
    @JsonKey(fromJson: dateTimeFromString) DateTime? completed_at,
    @JsonKey(fromJson: dateTimeFromString) DateTime? canceled_at,
  }) = _Order;

  Order._();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  // a condition where we need to listen to pusher for realtime update
  bool get isProcessing => [
        'waiting',
        'purchasing',
        'delivering',
      ].contains(status);
}

DateTime? dateTimeFromString(String? timestamp) {
  return timestamp == null ? null : DateTime.parse(timestamp).toLocal();
}
