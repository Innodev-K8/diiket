import 'dart:math';

import 'package:diiket/data/network/product_service.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/ui/hooks/paging_controller.dart';
import 'package:diiket/ui/widgets/products/medium_product_item.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginatedVerticalProductsSliverGrid extends HookWidget {
  const PaginatedVerticalProductsSliverGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // watch for market changes
    final market = useProvider(currentMarketProvider);

    final randomSeed = useMemoized<int>(() => Random().nextInt(1000));
    final controller = usePagingController<int, Product>(firstPageKey: 1);
    final repository = useProvider(productServiceProvider).state;

    final isMounted = useIsMounted();

    Future<void> _fetchPage(int pageKey) async {
      try {
        final paginatedProducts = await repository.getAllProducts(
          page: pageKey,
          randomSeed: randomSeed,
        );

        final isLastPage = pageKey >= (paginatedProducts.meta?.last_page ?? 0);

        // because we are using future and it may complete after the state has been disposed, we have to check if the state is still mounted
        if (!isMounted()) return;

        if (isLastPage) {
          controller.appendLastPage(paginatedProducts.data ?? []);
        } else {
          controller.appendPage(paginatedProducts.data ?? [], pageKey + 1);
        }
      } catch (error) {
        if (!isMounted()) return;

        controller.error = error;
      }
    }

    useEffect(() {
      controller.addPageRequestListener((pageKey) {
        _fetchPage(pageKey);
      });
      return null;
    }, [],);

    useEffect(() {
      controller.refresh();
      _fetchPage(1);
      return null;
    }, [market.state],);

    if (controller.itemList?.isEmpty == true) {
      return SliverToBoxAdapter();
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      sliver: PagedSliverGrid(
        pagingController: controller,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 100 / 165,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
        ),
        builderDelegate: PagedChildBuilderDelegate<Product>(
          itemBuilder: (context, item, index) {
            return MediumProductItem(product: item);
          },
          noItemsFoundIndicatorBuilder: (context) => SizedBox(),
        ),
        showNewPageProgressIndicatorAsGridChild: false,
      ),
    );
  }
}
