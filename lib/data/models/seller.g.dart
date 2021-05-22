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
    phone_number: json['phone_number'] as String?,
    type: json['type'] as String?,
    profile_picture: json['profile_picture'] as String?,
    profile_picture_url: json['profile_picture_url'] as String?,
  );
}

Map<String, dynamic> _$_$_SellerToJson(_$_Seller instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'phone_number': instance.phone_number,
      'type': instance.type,
      'profile_picture': instance.profile_picture,
      'profile_picture_url': instance.profile_picture_url,
    };
