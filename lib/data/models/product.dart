import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'product_category.dart';
import 'stall.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  @HiveType(typeId: 3, adapterName: 'ProductAdapter')
  const factory Product({
    @HiveField(0) int? id,
    @HiveField(1) int? stall_id,
    @HiveField(2) Stall? stall,
    @HiveField(3) String? name,
    @HiveField(4) String? description,
    @HiveField(5) String? photo_url,
    @HiveField(6) String? quantity_unit,
    @HiveField(7) int? weight,
    @HiveField(8) int? price,
    @HiveField(9) int? stocks,
    @HiveField(10) List<ProductCategory>? categories,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.fake() {
    return Product(
      quantity_unit: '-',
      stall: Stall.fake(),
    );
  }
}
