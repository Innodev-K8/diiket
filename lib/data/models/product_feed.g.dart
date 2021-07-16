// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductFeed _$_$_ProductFeedFromJson(Map<String, dynamic> json) {
  return _$_ProductFeed(
    title: json['title'] as String? ?? 'Produk',
    description: json['description'] as String?,
    image_url: json['image_url'] as String?,
    type: _$enumDecodeNullable(_$ProductSourceTypeEnumMap, json['type']) ??
        ProductSourceType.category,
    query: json['query'] as String? ?? 'all',
    require_auth: json['require_auth'] as bool? ?? false,
    limit: json['limit'] as int? ?? 5,
  );
}

Map<String, dynamic> _$_$_ProductFeedToJson(_$_ProductFeed instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.image_url,
      'type': _$ProductSourceTypeEnumMap[instance.type],
      'query': instance.query,
      'require_auth': instance.require_auth,
      'limit': instance.limit,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$ProductSourceTypeEnumMap = {
  ProductSourceType.category: 'category',
  ProductSourceType.scenario: 'scenario',
};
