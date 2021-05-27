import 'package:diiket/data/providers/products/products_search_history_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchHistory extends HookWidget {
  final Function(String)? onSelect;

  SearchHistory({this.onSelect});

  @override
  Widget build(BuildContext context) {
    final searchHistories = useProvider(productSearchHistoryProvider);

    if (searchHistories.isEmpty) return SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pencarian terakhir',
                style: kTextTheme.headline6!.copyWith(
                  color: ColorPallete.lightGray,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read(productSearchHistoryProvider.notifier).clear();
                },
                child: Text(
                  'Hapus semua',
                  style: kTextTheme.button!.copyWith(
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
              contentPadding: const EdgeInsets.all(0),
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
