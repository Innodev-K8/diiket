// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Seller _$_$_SellerFromJson(Map<String, dynamic> json) {
  return _$_Seller(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    address: json['address'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    type: json['type'] as String?,
    profilePicture: json['profilePicture'] as String?,
    profilePictureUrl: json['profilePictureUrl'] as String?,
  );
}

Map<String, dynamic> _$_$_SellerToJson(_$_Seller instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'type': instance.type,
      'profilePicture': instance.profilePicture,
      'profilePictureUrl': instance.profilePictureUrl,
    };
