// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<_$_Product> {
  @override
  final int typeId = 3;

  @override
  _$_Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Product(
      id: fields[0] as int?,
      stall_id: fields[1] as int?,
      stall: fields[2] as Stall?,
      name: fields[3] as String?,
      description: fields[4] as String?,
      photo_url: fields[5] as String?,
      quantity_unit: fields[6] as String?,
      weight: fields[7] as int?,
      price: fields[8] as int?,
      stocks: fields[9] as int?,
      categories: (fields[10] as List?)?.cast<ProductCategory>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_Product obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.stall_id)
      ..writeByte(2)
      ..write(obj.stall)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.photo_url)
      ..writeByte(6)
      ..write(obj.quantity_unit)
      ..writeByte(7)
      ..write(obj.weight)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.stocks)
      ..writeByte(10)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$_$_ProductFromJson(Map<String, dynamic> json) {
  return _$_Product(
    id: json['id'] as int?,
    stall_id: json['stall_id'] as int?,
    stall: json['stall'] == null
        ? null
        : Stall.fromJson(json['stall'] as Map<String, dynamic>),
    name: json['name'] as String?,
    description: json['description'] as String?,
    photo_url: json['photo_url'] as String?,
    quantity_unit: json['quantity_unit'] as String?,
    weight: json['weight'] as int?,
    price: json['price'] as int?,
    stocks: json['stocks'] as int?,
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stall_id': instance.stall_id,
      'stall': instance.stall,
      'name': instance.name,
      'description': instance.description,
      'photo_url': instance.photo_url,
      'quantity_unit': instance.quantity_unit,
      'weight': instance.weight,
      'price': instance.price,
      'stocks': instance.stocks,
      'categories': instance.categories,
    };
