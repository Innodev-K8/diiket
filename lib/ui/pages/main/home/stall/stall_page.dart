import 'dart:async';

import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/data/providers/stall/favorite_stall_provider.dart';
import 'package:diiket/data/providers/stall/stall_detail_provider.dart';
import 'package:diiket/data/services/dynamic_link_generators.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/common/custom_exception_message.dart';
import 'package:diiket/ui/widgets/orders/order_preview_panel.dart';
import 'package:diiket/ui/widgets/products/large_product_item.dart';
import 'package:diiket/ui/widgets/products/product_detail_bottom_sheet.dart';
import 'package:diiket/ui/widgets/products/vertical_scroll_product_list.dart';
import 'package:diiket/ui/widgets/stall/stall_photo.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class StallPage extends HookWidget {
  static const String route = '/home/stall';

  final int stallId;
  // product to autofocus on
  final int? focusedProductId;

  StallPage({
    Key? key,
    required this.stallId,
    this.focusedProductId,
  }) : super(key: key);

  final double _headerHeight = 200.0;
  final double _avatarSize = 89.0;

  final GlobalKey _autofocusProductKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final stallState = useProvider(stallDetailProvider(stallId));
    final market = useProvider(currentMarketProvider).state;
    final scrollController = useScrollController();

    useEffect(
      () {
        stallState.whenData((value) {
          Timer(Duration(milliseconds: 250), () {
            if (_autofocusProductKey.currentWidget != null &&
                _autofocusProductKey.currentWidget != null) {
              Scrollable.ensureVisible(
                _autofocusProductKey.currentContext!,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );

              ProductDetailBottomSheet.show(
                context,
                (_autofocusProductKey.currentWidget! as LargeProductItem)
                    .product,
              );
            }
          });
        });
        return null;
      },
      [stallState],
    );

    return Container(
      color: ColorPallete.backgroundColor,
      child: stallState.when(
        data: (stall) => Column(
          children: [
            Expanded(
              child: CustomScrollView(
                controller: scrollController,
                physics: BouncingScrollPhysics(),
                slivers: [
                  _buildAppBar(context, stall),
                  _buildContent(context, stall, market),
                ],
              ),
            ),
            OrderPreviewPanel(),
          ],
        ),
        loading: () => Center(
          child: CircularProgressIndicator(
            color: ColorPallete.secondaryColor,
          ),
        ),
        error: (error, stackTrace) => CustomExceptionMessage(error),
      ),
    );
  }

  SliverToBoxAdapter _buildContent(
    BuildContext context,
    Stall stall,
    Market? market,
  ) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        stall.name ?? '-',
                        style: kTextTheme.displaySmall,
                      ),
                    ),
                    SizedBox(width: 8),
                    _buildFavoriteButton(stall),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  stall.seller?.name ?? '-',
                  style: kTextTheme.titleMedium,
                ),
                SizedBox(height: 5),
                Text(
                  stall.is_open == true ? 'Buka' : 'Tutup',
                  style: kTextTheme.titleMedium!.copyWith(
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
                        '${market?.name}, Lt. ${stall.location_floor} Blok ${stall.location_block} No. ${stall.location_number}',
                        style: kTextTheme.titleMedium!.copyWith(
                          color: ColorPallete.darkGray,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Deskripsi toko',
                  style: kTextTheme.displayMedium,
                ),
                SizedBox(height: 5),
                Text(
                  stall.description ?? '-',
                ),
                VerticalScrollProductList(
                  shrinkWrap: true,
                  onItemTap: (Product product) {},
                  physics: NeverScrollableScrollPhysics(),
                  header: Text(
                    'Produk',
                    style: kTextTheme.displayMedium,
                  ),
                  products: (stall.products ?? [])
                      .map((p) => p.copyWith(stall: stall))
                      .toList(),
                  productItemBuilder: (Product product, _) => LargeProductItem(
                    key: product.id == focusedProductId
                        ? _autofocusProductKey
                        : null,
                    product: product,
                    onTap: () {
                      ProductDetailBottomSheet.show(context, product);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton(Stall stall) {
    useProvider(favoriteStallProvider);

    final notifier = useProvider(favoriteStallProvider.notifier);

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 250),
      switchInCurve: Curves.easeInQuint,
      switchOutCurve: Curves.easeOutQuint,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: notifier.isFavorite(stall)
          ? SizedBox(
              key: ValueKey('unfavorite'),
              width: 110,
              child: OutlinedButton(
                onPressed: () {
                  HapticFeedback.vibrate();
                  notifier.delete(stall);
                },
                child: Text(
                  'Langanan',
                  style: kTextTheme.labelLarge!.copyWith(
                    color: ColorPallete.primaryColor,
                  ),
                ),
              ),
            )
          : SizedBox(
              key: ValueKey('favorite'),
              width: 110,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPallete.primaryColor,
                  elevation: 0,
                ),
                onPressed: () {
                  HapticFeedback.vibrate();
                  notifier.add(stall);
                },
                child: Text(
                  'Langanan',
                ),
              ),
            ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context, Stall stall) {
    return SliverAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_rounded,
          color: ColorPallete.backgroundColor,
        ),
        onPressed: () => Utils.homeNav.currentState?.pop(),
      ),
      actions: [
        ShareStallButton(stall: stall),
        SizedBox(width: 8),
      ],
      expandedHeight: _headerHeight + 8,
      backgroundColor: Colors.white,
      foregroundColor: Colors.red,
      automaticallyImplyLeading: false,
      toolbarHeight: _avatarSize,
      elevation: 1,
      flexibleSpace: _buildHeader(stall),
    );
  }

  Widget _buildHeader(Stall stall) {
    return SizedBox(
      height: _headerHeight + _avatarSize / 2 + 8,
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
            child: StallPhoto(stall: stall),
          ),
          Positioned(
            left: 24.0,
            bottom: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorPallete.blueishGray,
                  width: 3.0,
                ),
              ),
              child: CircleAvatar(
                foregroundImage: NetworkImage(
                  stall.seller?.profile_picture_url ?? '-',
                ),
                backgroundColor: ColorPallete.primaryColor,
                radius: _avatarSize / 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShareStallButton extends HookWidget {
  final Stall stall;

  const ShareStallButton({
    Key? key,
    required this.stall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);
    final isMounted = useIsMounted();
    final dlGenerator = useProvider(dynamicLinkGeneratorProvider);

    return IconButton(
      onPressed: () async {
        if (isMounted()) isLoading.value = true;

        final uri = await dlGenerator.generateStallDeepLink(
          stall,
          referrer: context.read(authProvider),
        );

        await Share.share(uri.toString());

        if (isMounted()) isLoading.value = false;
      },
      icon: isLoading.value
          ? SmallLoading()
          : Icon(
              Icons.share,
              size: 18.0,
              color: Colors.white,
            ),
    );
  }
}
