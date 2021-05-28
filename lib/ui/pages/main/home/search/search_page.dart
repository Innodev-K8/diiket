import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/products/search_products_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/home/search/search_history.dart';
import 'package:diiket/ui/widgets/custom_exception_message.dart';
import 'package:diiket/ui/widgets/products/large_product_item.dart';
import 'package:diiket/ui/widgets/search_field.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPage extends StatefulWidget {
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
              Entry.opacity(
                delay: Duration(milliseconds: 500),
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
            Expanded(
              child: _showResult ? SearchResults() : SizedBox.shrink(),
              // child: Opacity(
              //   opacity: isQueryEmpty ? 0 : 1,
              //   child: _buildSearchResults(),
              // ),
            ),
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

    return productsState.when(
      data: (products) => VerticalScrollProductList(
        header: Text(
          '${products.data?.length} Hasil',
          style: kTextTheme.headline6!.copyWith(
            color: ColorPallete.darkGray,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        products: products.data ?? [],
      ),
      loading: () => Text('mencari'),
      error: (error, stackTrace) => CustomExceptionMessage(error),
    );
  }
}

class VerticalScrollProductList extends StatelessWidget {
  final List<Product> products;

  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Widget? header;

  const VerticalScrollProductList({
    Key? key,
    required this.products,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
    this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: header == null ? products.length : products.length + 1,
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) {
        if (header != null) {
          if (index == 0) {
            return header!;
          }

          index -= 1;
        }

        return Entry.scale(
          delay: Duration(milliseconds: 50 * index),
          child: LargeProductItem(
            product: products[index],
          ),
        );
      },
    );
  }
}
