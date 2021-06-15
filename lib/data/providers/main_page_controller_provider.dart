import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainPageController =
    StateNotifierProvider<MainPageController, int>((ref) {
  return MainPageController(ref.read);
});

class MainPageController extends StateNotifier<int> {
  final Reader _read;

  final _controller = PageController();

  final _duration = const Duration(milliseconds: 250);
  final _curves = Curves.easeInOutSine;

  MainPageController(this._read) : super(0) {
    _read(analyticsProvider).setCurrentScreen(screenName: pageName);
  }

  PageController get controller => _controller;

  Future<void> setPage(int page) async {
    state = page;

    await _controller.animateToPage(
      page,
      duration: _duration,
      curve: _curves,
    );

    _read(analyticsProvider).setCurrentScreen(screenName: pageName);

    // Utils.resetHomeNavigation();
  }

  String get pageName {
    switch (state) {
      case 0:
        return '/home';
      case 1:
        return '/order';
      case 2:
        return '/history';
      case 3:
        return '/profile';
      default:
        return 'unknown_page';
    }
  }
}
