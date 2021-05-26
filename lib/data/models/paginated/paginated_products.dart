import 'package:diiket/data/models/pagination/pagination_links.dart';
import 'package:diiket/data/models/pagination/pagination_meta.dart';
import 'package:diiket/data/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_products.freezed.dart';
part 'paginated_products.g.dart';

// UNTUK SENTARA TIAP DATA PAGINATION BIKIN DATA CLASS SENDIRI
// KARENA BELUM MEMUNGKINKAN MENGGUNAKAN GENERIC TYPES
// PENGENYA GINI NTAR :
//
// class Paginated<T> with _$Paginated<T> {}
//
// MAKENYA :
//
// Paginated<Product> paginatedProducts = await productService.getProductAtPage(2)

@freezed
class PaginatedProducts with _$PaginatedProducts {
  factory PaginatedProducts({
    List<Product>? data,
    PaginationLinks? links,
    PaginationMeta? meta,
  }) = _PaginatedProducts;

  factory PaginatedProducts.fromJson(Map<String, dynamic> json) =>
      _$PaginatedProductsFromJson(json);
}
