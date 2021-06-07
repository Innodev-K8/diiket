import 'package:diiket/data/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'seller.dart';

part 'stall.freezed.dart';
part 'stall.g.dart';

@freezed
abstract class Stall with _$Stall {
  @HiveType(typeId: 0, adapterName: 'StallAdapter')
  const factory Stall({
    @HiveField(0) int? id,
    @HiveField(1) Seller? seller,
    @HiveField(2) int? market_id,
    @HiveField(3) bool? is_open,
    @HiveField(4) String? name,
    @HiveField(5) String? description,
    @HiveField(6) String? photo_url,
    @HiveField(7) List<Product>? products,
    @HiveField(8) String? location_block,
    @HiveField(9) String? location_number,
    @HiveField(10) String? location_floor,
    @HiveField(11) String? location_detail,
    @HiveField(12) String? location_lat,
    @HiveField(13) String? location_lng,
    @HiveField(14) int? verified_at,
  }) = _Stall;

  factory Stall.fromJson(Map<String, dynamic> json) => _$StallFromJson(json);
}
