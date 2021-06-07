// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCategoryAdapter extends TypeAdapter<_$_ProductCategory> {
  @override
  final int typeId = 4;

  @override
  _$_ProductCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ProductCategory(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ProductCategory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductCategory _$_$_ProductCategoryFromJson(Map<String, dynamic> json) {
  return _$_ProductCategory(
    id: json['id'] as int?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$_$_ProductCategoryToJson(_$_ProductCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
