import 'dart:convert';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/helpers/casting_helper.dart';
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
  final Reader _read;

  ProductCategoryMenuItemsState(this._read) : super([]) {
    fetch();
  }

  List<CategoryButton> get defaultFeed => [
        CategoryButton(
          fileName: 'meat',
          text: 'Daging',
          onTap: () {
            Utils.navigateToProductByCategoryOld('daging', 'Daging Segar');
          },
        ),
        CategoryButton(
          fileName: 'fish',
          text: 'Ikan',
          onTap: () {
            Utils.navigateToProductByCategoryOld('ikan', 'Ikan Segar');
          },
        ),
        CategoryButton(
          fileName: 'seasoning',
          text: 'Bumbu',
          onTap: () {
            Utils.navigateToProductByCategoryOld('bumbu', 'Bumbu Dapur');
          },
        ),
        CategoryButton(
          fileName: 'rice',
          text: 'Beras',
          onTap: () {
            Utils.navigateToProductByCategoryOld('beras', 'Beras');
          },
        ),
        CategoryButton(
          fileName: 'bread',
          text: 'Roti',
          onTap: () {
            Utils.navigateToProductByCategoryOld('roti', 'Roti');
          },
        ),
        CategoryButton(
          fileName: 'vegetable',
          text: 'Sayur',
          onTap: () {
            Utils.navigateToProductByCategoryOld('sayur', 'Sayuran Segar');
          },
        ),
        CategoryButton(
          fileName: 'fruit',
          text: 'Buah',
          onTap: () {
            Utils.navigateToProductByCategoryOld('buah', 'Buah-buahan');
          },
        ),
      ];

  Future<void> fetch() async {
    try {
      if (state.isEmpty) state = defaultFeed;

      final feedJsonString =
          _read(remoteConfigProvider).getString('product_category_menu_items');

      final List<dynamic> json = castOrFallback(jsonDecode(feedJsonString), []);

      state = json
          .map((item) => CategoryButton(
                text: castOrFallback(item['text'], '-'),
                fileName: castOrFallback(item['iconFileName'], ''),
                onTap: () {
                  Utils.navigateToProductByCategoryOld(
                    castOrNull(item['category']),
                    castOrNull(item['pageLabel']),
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
