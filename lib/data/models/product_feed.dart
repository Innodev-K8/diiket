import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_feed.freezed.dart';
part 'product_feed.g.dart';

@freezed
class ProductFeed with _$ProductFeed {
  factory ProductFeed({
    String? label,
    String? query,
    bool? require_auth,
  }) = _ProductFeed;

  factory ProductFeed.fromJson(Map<String, dynamic> json) =>
      _$ProductFeedFromJson(json);
}
