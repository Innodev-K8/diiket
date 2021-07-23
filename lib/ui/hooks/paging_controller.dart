import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

PagingController<T, Y> usePagingController<T, Y>({
  required T firstPageKey,
  int? invisibleItemsThreshold,
}) {
  return use(_PagingController<T, Y>(
    firstPageKey: firstPageKey,
    invisibleItemsThreshold: invisibleItemsThreshold,
  ));
}

class _PagingController<T, Y> extends Hook<PagingController<T, Y>> {
  final T firstPageKey;
  final int? invisibleItemsThreshold;

  const _PagingController({
    required this.firstPageKey,
    this.invisibleItemsThreshold,
  });

  @override
  _PagingControllerState<T, Y> createState() => _PagingControllerState();
}

class _PagingControllerState<T, Y>
    extends HookState<PagingController<T, Y>, _PagingController<T, Y>> {
  late final PagingController<T, Y> _controller = PagingController<T, Y>(
    firstPageKey: hook.firstPageKey,
    invisibleItemsThreshold: hook.invisibleItemsThreshold,
  );

  @override
  void initHook() {
    super.initHook();
  }

  @override
  PagingController<T, Y> build(BuildContext context) => _controller;

  @override
  void dispose() => _controller.dispose();
}
