import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';

import 'package:diiket/ui/widgets/products/medium_product_item.dart';

class HorizontalScrollProductList extends StatefulWidget {
  final List<Product> products;
  final Future<bool> Function() onLoadMore;
  final bool isFinish;

  const HorizontalScrollProductList({
    Key? key,
    required this.products,
    required this.onLoadMore,
    this.isFinish = false,
  }) : super(key: key);

  @override
  _HorizontalScrollProductListState createState() =>
      _HorizontalScrollProductListState();
}

class _HorizontalScrollProductListState
    extends State<HorizontalScrollProductList> {
  late ScrollController _controller;

  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (mounted && notification is ScrollEndNotification) {
      if (_controller.position.extentAfter == 0) {
        setState(() {
          isLoadingMore = true;
        });

        widget.onLoadMore().then((success) {
          setState(() {
            isLoadingMore = false;
          });
        });
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      return _buildEmptyList();
    }

    return SizedBox(
      height: 230.0,
      child: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: ListView.separated(
          controller: _controller,
          clipBehavior: Clip.none,
          physics: BouncingScrollPhysics(),
          itemCount: isLoadingMore && !widget.isFinish
              ? widget.products.length + 1
              : widget.products.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          separatorBuilder: (context, index) => SizedBox(width: 15.0),
          itemBuilder: (context, index) => index == widget.products.length
              ? _buildLoading()
              : MediumProductItem(
                  product: widget.products[index],
                ),
        ),
      ),
    );
  }

  SizedBox _buildLoading() {
    return SizedBox(
      width: 54.0,
      child: Center(
        child: CircularProgressIndicator(
          color: ColorPallete.primaryColor,
        ),
      ),
    );
  }

  Widget _buildEmptyList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text('Tidak ada produk yang dapat ditampilkan...'),
    );
  }
}
