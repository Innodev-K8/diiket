import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/products/products_search_history_provider.dart';
import 'package:diiket/data/providers/products/search_products_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/home/search/search_history.dart';
import 'package:diiket/ui/widgets/custom_exception_message.dart';
import 'package:diiket/ui/widgets/products/large_product_item.dart';
import 'package:diiket/ui/widgets/search_field.dart';
import 'package:easy_debounce/easy_debounce.dart';
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
        child: CustomScrollView(
          slivers: [
            _buildAppBar(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_searchQuery == null || _searchQuery == '')
                    Entry.opacity(
                      delay: Duration(milliseconds: 500),
                      child: SearchHistory(
                        onSelect: (text) {
                          FocusScope.of(context).unfocus();

                          setState(
                            () {
                              _controller.text = text;
                              _searchQuery = text;
                              context
                                  .read(searchProductsProvider.notifier)
                                  .searchProducts(text);
                            },
                          );
                        },
                      ),
                    ),
                  Opacity(
                    opacity: _searchQuery?.isEmpty == true ? 0 : 1,
                    child: _buildSearchResults(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Consumer _buildSearchResults() {
    return Consumer(
      builder: (context, watch, child) {
        final productsState = watch(searchProductsProvider);

        return productsState.when(
          data: (products) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    '${products.data?.length} Hasil',
                    style: kTextTheme.headline6!.copyWith(
                      color: ColorPallete.darkGray,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                VerticalScrollProductList(
                  products: products.data ?? [],
                ),
              ],
            ),
          ),
          loading: () => Text('mencari'),
          error: (error, stackTrace) => CustomExceptionMessage(error),
        );
      },
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      backgroundColor: ColorPallete.backgroundColor,
      elevation: 1,
      pinned: true,
      toolbarHeight: 78.0,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        height: 78.0,
        decoration: BoxDecoration(
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
                  },
                  onChanged: (query) {
                    setState(() {
                      _searchQuery = query;
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
      ),
    );
  }
}

class VerticalScrollProductList extends StatelessWidget {
  final List<Product> products;

  const VerticalScrollProductList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) => Entry.scale(
        delay: Duration(milliseconds: 50 * index),
        child: LargeProductItem(
          product: products[index],
        ),
      ),
    );
  }
}
