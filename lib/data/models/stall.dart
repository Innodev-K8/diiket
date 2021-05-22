import 'package:freezed_annotation/freezed_annotation.dart';

import 'seller.dart';

part 'stall.freezed.dart';
part 'stall.g.dart';

@freezed
abstract class Stall with _$Stall {
  const factory Stall({
    int? id,
    Seller? seller,
    int? marketId,
    bool? isOpen,
    String? name,
    String? description,
    String? photo,
    String? locationBlock,
    String? locationNumber,
    String? locationFloor,
    String? locationDetail,
    String? locationLat,
    String? locationLng,
    int? verifiedAt,
  }) = _Stall;

  factory Stall.fromJson(Map<String, dynamic> json) => _$StallFromJson(json);
}
