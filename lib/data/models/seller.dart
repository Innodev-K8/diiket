import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'seller.freezed.dart';
part 'seller.g.dart';

@freezed
abstract class Seller with _$Seller {
  @HiveType(typeId: 1, adapterName: 'SellerAdapter')
  const factory Seller({
    @HiveField(0) int? id,
    @HiveField(2) String? name,
    @HiveField(3) String? email,
    @HiveField(4) String? address,
    @HiveField(5) String? phone_number,
    @HiveField(6) String? type,
    @HiveField(7) String? profile_picture,
    @HiveField(8) String? profile_picture_url,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}
