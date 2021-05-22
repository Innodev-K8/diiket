import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller.freezed.dart';
part 'seller.g.dart';

@freezed
abstract class Seller with _$Seller {
  const factory Seller({
    int? id,
    String? name,
    String? email,
    String? address,
    String? phone_number,
    String? type,
    String? profile_picture,
    String? profile_picture_url,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}
