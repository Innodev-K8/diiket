// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductFeed _$_$_ProductFeedFromJson(Map<String, dynamic> json) {
  return _$_ProductFeed(
    label: json['label'] as String?,
    query: json['query'] as String?,
    require_auth: json['require_auth'] as bool?,
  );
}

Map<String, dynamic> _$_$_ProductFeedToJson(_$_ProductFeed instance) =>
    <String, dynamic>{
      'label': instance.label,
      'query': instance.query,
      'require_auth': instance.require_auth,
    };
