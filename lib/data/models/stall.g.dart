// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stall.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StallAdapter extends TypeAdapter<_$_Stall> {
  @override
  final int typeId = 0;

  @override
  _$_Stall read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Stall(
      id: fields[0] as int?,
      seller: fields[1] as Seller?,
      market_id: fields[2] as int?,
      is_open: fields[3] as bool?,
      name: fields[4] as String?,
      description: fields[5] as String?,
      photo_url: fields[6] as String?,
      products: (fields[7] as List?)?.cast<Product>(),
      location_block: fields[8] as String?,
      location_number: fields[9] as String?,
      location_floor: fields[10] as String?,
      location_detail: fields[11] as String?,
      location_lat: fields[12] as String?,
      location_lng: fields[13] as String?,
      verified_at: fields[14] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Stall obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.seller)
      ..writeByte(2)
      ..write(obj.market_id)
      ..writeByte(3)
      ..write(obj.is_open)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.photo_url)
      ..writeByte(7)
      ..write(obj.products)
      ..writeByte(8)
      ..write(obj.location_block)
      ..writeByte(9)
      ..write(obj.location_number)
      ..writeByte(10)
      ..write(obj.location_floor)
      ..writeByte(11)
      ..write(obj.location_detail)
      ..writeByte(12)
      ..write(obj.location_lat)
      ..writeByte(13)
      ..write(obj.location_lng)
      ..writeByte(14)
      ..write(obj.verified_at);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StallAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stall _$_$_StallFromJson(Map<String, dynamic> json) {
  return _$_Stall(
    id: json['id'] as int?,
    seller: json['seller'] == null
        ? null
        : Seller.fromJson(json['seller'] as Map<String, dynamic>),
    market_id: json['market_id'] as int?,
    is_open: json['is_open'] as bool?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    photo_url: json['photo_url'] as String?,
    products: (json['products'] as List<dynamic>?)
        ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
    location_block: json['location_block'] as String?,
    location_number: json['location_number'] as String?,
    location_floor: json['location_floor'] as String?,
    location_detail: json['location_detail'] as String?,
    location_lat: json['location_lat'] as String?,
    location_lng: json['location_lng'] as String?,
    verified_at: json['verified_at'] as int?,
  );
}

Map<String, dynamic> _$_$_StallToJson(_$_Stall instance) => <String, dynamic>{
      'id': instance.id,
      'seller': instance.seller,
      'market_id': instance.market_id,
      'is_open': instance.is_open,
      'name': instance.name,
      'description': instance.description,
      'photo_url': instance.photo_url,
      'products': instance.products,
      'location_block': instance.location_block,
      'location_number': instance.location_number,
      'location_floor': instance.location_floor,
      'location_detail': instance.location_detail,
      'location_lat': instance.location_lat,
      'location_lng': instance.location_lng,
      'verified_at': instance.verified_at,
    };
