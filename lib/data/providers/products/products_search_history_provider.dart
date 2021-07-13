import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productSearchHistoryProvider =
    StateNotifierProvider<ProductSearchHistoryState, List<String>>((ref) {
  return ProductSearchHistoryState();
});

class ProductSearchHistoryState extends StateNotifier<List<String>> {
  Box<String>? _box;

  ProductSearchHistoryState() : super([]) {
    init();
  }

  Future<void> init() async {
    _box ??= await Hive.openBox<String>('product-search-history');

    state = _box!.values.toList();

    _box!.listenable().addListener(() {
      if (mounted) state = _box!.values.toList();
    });
  }

  Future<void> clear() async {
    await _box?.clear();
  }

  Future<void> add(String history) async {
    if (state.contains(history)) {
      await delete(history);
    }

    await _box?.add(history);
  }

  Future<void> delete(String history) async {
    await _box?.deleteAt(state.indexOf(history));
  }
}
