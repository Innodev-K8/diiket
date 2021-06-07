import 'dart:convert';

import 'package:diiket/data/models/product_feed.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/data/providers/products/products_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productFeedProvider =
    StateNotifierProvider<ProductFeedsState, List<ProductFeed>>((ref) {
  return ProductFeedsState(ref.read);
});

class ProductFeedsState extends StateNotifier<List<ProductFeed>> {
  Reader _read;

  ProductFeedsState(this._read) : super([]) {
    fetch();
  }

  List<ProductFeed> get defaultFeed => [
        ProductFeed(
          label: 'Produk',
          query: ProductFamily.all,
        ),
        ProductFeed(
          label: 'Terlaris',
          query: ProductFamily.popular,
        ),
      ];

  Future<void> fetch() async {
    try {
      if (state.isEmpty) state = defaultFeed;

      await _read(remoteConfigProvider).fetchAndActivate();

      final feedJsonString =
          _read(remoteConfigProvider).getString('product_feeds');

      final List<dynamic> json = jsonDecode(feedJsonString);

      state = json.map((json) => ProductFeed.fromJson(json)).toList();
    } on Exception catch (_) {
      // set to default
      state = defaultFeed;
    }
  }
}
