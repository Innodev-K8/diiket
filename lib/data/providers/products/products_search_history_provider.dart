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
    if (_box == null) {
      _box = await Hive.openBox<String>('product-search-history');
    }

    state = _box!.values.toList();

    _box!.listenable().addListener(() {
      if (mounted) state = _box!.values.toList();
    });
  }

  Future<void> clear() async {
    await _box?.clear();
  }

  Future<void> add(String history) async {
    return await _box?.put(history, history);
  }

  Future<void> delete(String history) async {
    return await _box?.delete(history);
  }
}
