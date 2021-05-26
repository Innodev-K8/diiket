import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_category.dart';
import 'stall.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    int? id,
    int? stall_id,
    Stall? stall,
    String? name,
    String? description,
    String? photo,
    String? photo_url,
    String? quantity_unit,
    int? weight,
    int? price,
    int? stocks,
    List<ProductCategory>? categories,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
