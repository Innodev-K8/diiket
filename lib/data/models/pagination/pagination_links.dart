import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_links.freezed.dart';
part 'pagination_links.g.dart';

@freezed
class PaginationLinks with _$PaginationLinks {
  factory PaginationLinks({
    String? first,
    String? last,
    String? prev,
    String? next,
  }) = _PaginationLinks;

  factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinksFromJson(json);
}
