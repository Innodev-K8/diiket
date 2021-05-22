// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$_$_ProductFromJson(Map<String, dynamic> json) {
  return _$_Product(
    id: json['id'] as int?,
    stallId: json['stallId'] as int?,
    stall: json['stall'] == null
        ? null
        : Stall.fromJson(json['stall'] as Map<String, dynamic>),
    name: json['name'] as String?,
    description: json['description'] as String?,
    image: json['image'] as String?,
    quantityUnit: json['quantityUnit'] as String?,
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
      'stallId': instance.stallId,
      'stall': instance.stall,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'quantityUnit': instance.quantityUnit,
      'weight': instance.weight,
      'price': instance.price,
      'stocks': instance.stocks,
      'categories': instance.categories,
    };
