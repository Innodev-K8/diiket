import 'package:diiket/data/providers/products/products_search_history_provider.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchHistory extends HookWidget {
  final Function(String)? onSelect;

  const SearchHistory({this.onSelect});

  @override
  Widget build(BuildContext context) {
    final searchHistories =
        useProvider(productSearchHistoryProvider).reversed.toList();

    if (searchHistories.isEmpty) return SizedBox.shrink();

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pencarian terakhir',
                style: kTextTheme.titleLarge!.copyWith(
                  color: ColorPallete.lightGray,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read(productSearchHistoryProvider.notifier).clear();
                },
                child: Text(
                  'Hapus semua',
                  style: kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: ColorPallete.darkGray,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: searchHistories.length,
            itemBuilder: (context, index) => ListTile(
              // ignore: use_named_constants
              contentPadding: const EdgeInsets.only(),
              onTap: () => onSelect?.call(searchHistories[index]),
              title: Text(searchHistories[index]),
              trailing: IconButton(
                onPressed: () {
                  context
                      .read(productSearchHistoryProvider.notifier)
                      .delete(searchHistories[index]);
                },
                icon: Icon(
                  Icons.clear_rounded,
                  size: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
