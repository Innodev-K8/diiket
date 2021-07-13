import 'package:diiket/data/models/stall.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteStallProvider =
    StateNotifierProvider<FavoriteStallState, List<Stall>>((ref) {
  return FavoriteStallState();
});

class FavoriteStallState extends StateNotifier<List<Stall>> {
  Box<Stall>? _box;

  FavoriteStallState() : super([]) {
    init();
  }

  Future<void> init() async {
    _box ??= await Hive.openBox<Stall>('favorite-stalls');

    state = _box!.values.toList();

    _box!.listenable().addListener(() {
      if (mounted) state = _box!.values.toList();
    });
  }

  Future<void> clear() async {
    await _box?.clear();
  }

  Future<void> add(Stall stall) async {
    return await _box?.put(stall.id, stall);
  }

  Future<void> delete(Stall stall) async {
    return await _box?.delete(stall.id);
  }

  bool isFavorite(Stall stall) {
    return state.where((s) => s.id == stall.id).isNotEmpty;
  }
}
