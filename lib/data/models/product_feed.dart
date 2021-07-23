import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_feed.freezed.dart';
part 'product_feed.g.dart';

enum ProductSourceType {
  @JsonValue('category')
  category,
  @JsonValue('scenario')
  scenario,
}

@freezed
class ProductFeed with _$ProductFeed {
  factory ProductFeed({
    @Default('Produk') String title,
    String? description,
    String? image_url,
    @Default(ProductSourceType.category) ProductSourceType type,
    @Default('all') String query,
    @Default(false) bool? require_auth,
    @Default(5) int limit,
  }) = _ProductFeed;

  factory ProductFeed.fromJson(Map<String, dynamic> json) =>
      _$ProductFeedFromJson(json);
}
