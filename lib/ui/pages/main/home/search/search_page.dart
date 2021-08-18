import 'package:diiket/data/providers/products/search_products_provider.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/home/search/search_history.dart';
import 'package:diiket/ui/widgets/common/custom_exception_message.dart';
import 'package:diiket/ui/widgets/orders/order_preview_panel.dart';
import 'package:diiket/ui/widgets/products/loading/vertical_scroll_product_list_loading.dart';
import 'package:diiket/ui/widgets/products/vertical_scroll_product_list.dart';
import 'package:diiket/ui/widgets/inputs/search_field.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPage extends StatefulWidget {
  static const String route = '/home/search';

  final bool autofocus;

  const SearchPage({
    Key? key,
    this.autofocus = false,
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  String? _searchQuery;
  bool _showResult = false;

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorPallete.backgroundColor,
        child: Column(
          children: [
            _buildAppBar(),
            if (!_showResult)
              Expanded(
                child: Entry.offset(
                  duration: Duration(milliseconds: 500),
                  yOffset: -100,
                  child: Entry.opacity(
                    delay: Duration(milliseconds: 250),
                    child: SearchHistory(
                      onSelect: (text) {
                        FocusScope.of(context).unfocus();

                        context
                            .read(searchProductsProvider.notifier)
                            .searchProducts(text);

                        setState(
                          () {
                            _controller.text = text;
                            _searchQuery = text;
                            _showResult = true;
                          },
                        );
                      },
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: SearchResults(),
              ),
            OrderPreviewPanel(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: 78.0,
      decoration: BoxDecoration(
        color: ColorPallete.backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: ColorPallete.lightGray.withOpacity(0.5),
          ),
        ),
      ),
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 18,
        bottom: 15,
      ),
      child: Row(
        children: [
          Expanded(
            child: Hero(
              tag: 'search-field',
              child: SearchField(
                controller: _controller,
                autofocus: widget.autofocus,
                showClearButton: _searchQuery?.isNotEmpty ?? false,
                onSubmitted: (value) {
                  context
                      .read(searchProductsProvider.notifier)
                      .searchProducts(value);

                  setState(() {
                    _showResult = true;
                  });
                },
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                    _showResult = false;
                  });
                },
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Utils.homeNav.currentState?.pop();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 0, 12.0),
              child: Text(
                'Batal',
                style: kTextTheme.button!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchResults extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final productsState = useProvider(searchProductsProvider);

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      switchInCurve: Curves.easeOut,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween(
            begin: Offset(0, 0.05),
            end: Offset(0, 0),
          ).animate(animation),
          child: child,
        ),
      ),
      child: productsState.when(
        data: (products) => VerticalScrollProductList(
          header: Text(
            '${products.data?.length} Hasil',
            style: kTextTheme.headline6!.copyWith(
              color: ColorPallete.darkGray,
            ),
          ),
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          products: products.data ?? [],
          entryEnabled: false,
        ),
        loading: () => VerticalScrollProductListLoading(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        ),
        error: (error, stackTrace) => CustomExceptionMessage(error),
      ),
    );
  }
}
