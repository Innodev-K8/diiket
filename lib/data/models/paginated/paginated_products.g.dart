// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginatedProducts _$_$_PaginatedProductsFromJson(Map<String, dynamic> json) {
  return _$_PaginatedProducts(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
    links: json['links'] == null
        ? null
        : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
    meta: json['meta'] == null
        ? null
        : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PaginatedProductsToJson(
        _$_PaginatedProducts instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };
