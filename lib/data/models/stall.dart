import 'package:diiket/data/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'seller.dart';

part 'stall.freezed.dart';
part 'stall.g.dart';

@freezed
abstract class Stall with _$Stall {
  const factory Stall({
    int? id,
    Seller? seller,
    int? market_id,
    bool? is_open,
    String? name,
    String? description,
    String? photo,
    List<Product>? products,
    String? location_block,
    String? location_number,
    String? location_floor,
    String? location_detail,
    String? location_lat,
    String? location_lng,
    int? verified_at,
  }) = _Stall;

  factory Stall.fromJson(Map<String, dynamic> json) => _$StallFromJson(json);
}
