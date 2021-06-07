import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_category.freezed.dart';
part 'product_category.g.dart';

@freezed
abstract class ProductCategory with _$ProductCategory {
  @HiveType(typeId: 4, adapterName: 'ProductCategoryAdapter')
  const factory ProductCategory({
    @HiveField(0) int? id,
    @HiveField(1) String? name,
  }) = _ProductCategory;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}
