// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginationMeta _$_$_PaginationMetaFromJson(Map<String, dynamic> json) {
  return _$_PaginationMeta(
    current_page: json['current_page'] as int?,
    from: json['from'] as int?,
    last_page: json['last_page'] as int?,
    per_page: json['per_page'] as int?,
    to: json['to'] as int?,
    total: json['total'] as int?,
    path: json['path'] as String?,
  );
}

Map<String, dynamic> _$_$_PaginationMetaToJson(_$_PaginationMeta instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'from': instance.from,
      'last_page': instance.last_page,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
      'path': instance.path,
    };
