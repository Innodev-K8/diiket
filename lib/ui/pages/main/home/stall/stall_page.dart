import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/models/stall.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/data/providers/stall/stall_detail_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/custom_exception_message.dart';
import 'package:diiket/ui/widgets/orders/order_preview_panel.dart';
import 'package:diiket/ui/widgets/products/vertical_scroll_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StallPage extends HookWidget {
  final int stallId;

  const StallPage({
    Key? key,
    required this.stallId,
  }) : super(key: key);

  final double _headerHeight = 176.0;
  final double _avatarSize = 72.0;

  @override
  Widget build(BuildContext context) {
    final stallState = useProvider(stallDetailProvider(stallId));
    final market = useProvider(currentMarketProvider).state;

    return Container(
      color: ColorPallete.backgroundColor,
      child: stallState.when(
        data: (stall) => Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  _buildAppBar(stall),
                  _buildContent(stall, market),
                ],
              ),
            ),
            OrderPreviewPanel(),
          ],
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => CustomExceptionMessage(error),
      ),
    );
  }

  SliverToBoxAdapter _buildContent(Stall stall, Market market) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stall.name ?? '-',
                  style: kTextTheme.headline3,
                ),
                SizedBox(height: 5),
                Text(
                  stall.seller?.name ?? '-',
                  style: kTextTheme.subtitle1,
                ),
                SizedBox(height: 5),
                Text(
                  stall.is_open == true ? 'Buka' : 'Tutup',
                  style: kTextTheme.subtitle1!.copyWith(
                    color: stall.is_open == true
                        ? ColorPallete.successColor
                        : ColorPallete.infoColor,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 18.0,
                      color: ColorPallete.darkGray,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '${market.name}, Lt. ${stall.location_floor} Blok ${stall.location_block} No. ${stall.location_number}',
                        style: kTextTheme.subtitle1!.copyWith(
                          color: ColorPallete.darkGray,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Deskripsi toko',
                  style: kTextTheme.headline2,
                ),
                SizedBox(height: 5),
                Text(
                  stall.description ?? '-',
                ),
                VerticalScrollProductList(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  header: Text(
                    'Produk',
                    style: kTextTheme.headline2,
                  ),
                  products: (stall.products ?? [])
                      .map((p) => p.copyWith(stall: stall))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar(Stall stall) {
    return SliverAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_rounded,
          color: ColorPallete.backgroundColor,
        ),
        onPressed: () => Utils.homeNav.currentState?.pop(),
      ),
      expandedHeight: _headerHeight,
      backgroundColor: Colors.white,
      foregroundColor: Colors.red,
      automaticallyImplyLeading: false,
      toolbarHeight: _avatarSize,
      elevation: 1,
      flexibleSpace: _buildHeader(stall),
    );
  }

  SizedBox _buildHeader(Stall stall) {
    return SizedBox(
      height: _headerHeight + _avatarSize / 2,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: _headerHeight,
            width: double.infinity,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.transparent,
                ],
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: stall.photo_url ?? '-',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 24.0,
            bottom: 0,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                stall.seller?.profile_picture_url ?? '-',
              ),
              radius: _avatarSize / 2,
            ),
          )
        ],
      ),
    );
  }
}
