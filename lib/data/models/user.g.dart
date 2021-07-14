// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as int?,
    firebase_uid: json['firebase_uid'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    address: json['address'] as String?,
    phone_number: json['phone_number'] as String?,
    type: json['type'] as String?,
    profile_picture: json['profile_picture'] as String?,
    profile_picture_url: json['profile_picture_url'] as String?,
    driver_detail: json['driver_detail'] == null
        ? null
        : DriverDetaill.fromJson(json['driver_detail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'firebase_uid': instance.firebase_uid,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'phone_number': instance.phone_number,
      'type': instance.type,
      'profile_picture': instance.profile_picture,
      'profile_picture_url': instance.profile_picture_url,
      'driver_detail': instance.driver_detail?.toJson(),
    };
