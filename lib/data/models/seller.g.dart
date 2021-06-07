// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SellerAdapter extends TypeAdapter<_$_Seller> {
  @override
  final int typeId = 1;

  @override
  _$_Seller read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Seller(
      id: fields[0] as int?,
      name: fields[2] as String?,
      email: fields[3] as String?,
      address: fields[4] as String?,
      phone_number: fields[5] as String?,
      type: fields[6] as String?,
      profile_picture: fields[7] as String?,
      profile_picture_url: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Seller obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.phone_number)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.profile_picture)
      ..writeByte(8)
      ..write(obj.profile_picture_url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SellerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
