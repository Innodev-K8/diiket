// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_stalls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginatedStalls _$_$_PaginatedStallsFromJson(Map<String, dynamic> json) {
  return _$_PaginatedStalls(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Stall.fromJson(e as Map<String, dynamic>))
        .toList(),
    links: json['links'] == null
        ? null
        : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
    meta: json['meta'] == null
        ? null
        : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PaginatedStallsToJson(_$_PaginatedStalls instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };
