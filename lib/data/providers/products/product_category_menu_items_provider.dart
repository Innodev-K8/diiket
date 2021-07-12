import 'dart:convert';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/category_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productCategoryMenuItemsProvider =
    StateNotifierProvider<ProductCategoryMenuItemsState, List<CategoryButton>>(
        (ref) {
  return ProductCategoryMenuItemsState(ref.read);
});

class ProductCategoryMenuItemsState
    extends StateNotifier<List<CategoryButton>> {
  Reader _read;

  ProductCategoryMenuItemsState(this._read) : super([]) {
    fetch();
  }

  List<CategoryButton> get defaultFeed => [
        CategoryButton(
          fileName: 'meat',
          text: 'Daging',
          onTap: () {
            Utils.navigateToProductByCategory('daging', 'Daging Segar');
          },
        ),
        CategoryButton(
          fileName: 'fish',
          text: 'Ikan',
          onTap: () {
            Utils.navigateToProductByCategory('ikan', 'Ikan Segar');
          },
        ),
        CategoryButton(
          fileName: 'seasoning',
          text: 'Bumbu',
          onTap: () {
            Utils.navigateToProductByCategory('bumbu', 'Bumbu Dapur');
          },
        ),
        CategoryButton(
          fileName: 'rice',
          text: 'Beras',
          onTap: () {
            Utils.navigateToProductByCategory('beras', 'Beras');
          },
        ),
        CategoryButton(
          fileName: 'bread',
          text: 'Roti',
          onTap: () {
            Utils.navigateToProductByCategory('roti', 'Roti');
          },
        ),
        CategoryButton(
          fileName: 'vegetable',
          text: 'Sayur',
          onTap: () {
            Utils.navigateToProductByCategory('sayur', 'Sayuran Segar');
          },
        ),
        CategoryButton(
          fileName: 'fruit',
          text: 'Buah',
          onTap: () {
            Utils.navigateToProductByCategory('buah', 'Buah-buahan');
          },
        ),
      ];

  Future<void> fetch() async {
    try {
      if (state.isEmpty) state = defaultFeed;

      final feedJsonString =
          _read(remoteConfigProvider).getString('product_category_menu_items');

      final List<dynamic> json = jsonDecode(feedJsonString);

      state = json
          .map((item) => CategoryButton(
                text: item['text'],
                fileName: item['iconFileName'],
                onTap: () {
                  Utils.navigateToProductByCategory(
                    item['category'],
                    item['pageLabel'],
                  );
                },
              ))
          .toList();
    } on Exception catch (_) {
      // set to default
      state = defaultFeed;
    }
  }
}
