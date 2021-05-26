import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_meta.freezed.dart';
part 'pagination_meta.g.dart';

@freezed
class PaginationMeta with _$PaginationMeta {
  factory PaginationMeta({
    int? current_page,
    int? from,
    int? last_page,
    int? per_page,
    int? to,
    int? total,
    String? path,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}
