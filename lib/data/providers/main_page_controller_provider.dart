import 'package:diiket/ui/common/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainPageController =
    StateNotifierProvider<MainPageController, int>((ref) {
  return MainPageController();
});

class MainPageController extends StateNotifier<int> {
  final _controller = PageController();

  final _duration = const Duration(milliseconds: 250);
  final _curves = Curves.easeInOutSine;

  MainPageController() : super(0);

  PageController get controller => _controller;

  Future<void> setPage(int page) async {
    await _controller.animateToPage(
      page,
      duration: _duration,
      curve: _curves,
    );

    state = page;

    Utils.resetHomeNavigation();
  }
}
