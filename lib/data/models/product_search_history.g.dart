// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_search_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductSearchHistoryAdapter extends TypeAdapter<_$_ProductSearchHistory> {
  @override
  final int typeId = 0;

  @override
  _$_ProductSearchHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ProductSearchHistory(
      id: fields[0] as int?,
      query: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ProductSearchHistory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.query);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductSearchHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductSearchHistory _$_$_ProductSearchHistoryFromJson(
    Map<String, dynamic> json) {
  return _$_ProductSearchHistory(
    id: json['id'] as int?,
    query: json['query'] as String?,
  );
}

Map<String, dynamic> _$_$_ProductSearchHistoryToJson(
        _$_ProductSearchHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'query': instance.query,
    };
