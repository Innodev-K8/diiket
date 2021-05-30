import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/models/delivery_detail.dart';
import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/main_page_controller_provider.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/ui/common/helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/utils/place_picker.dart';
import 'package:diiket/ui/widgets/orders/confirm_order_button.dart';
import 'package:diiket/ui/widgets/products/vertical_scroll_product_list.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:trust_location/trust_location.dart';

class CartPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final order = useProvider(activeOrderProvider);
    final deliveryDetail = useProvider(deliveryDetailProvider);

    useEffect(() {
      // always update order when we open this page
      context.read(activeOrderProvider.notifier).retrieveActiveOrder();
    }, []);

    return SafeArea(
      child: Container(
        color: ColorPallete.backgroundColor,
        child: Column(
          children: [
            _buildAppBar('Keranjang'),
            if (order != null)
              Expanded(
                child: Stack(
                  children: [
                    RefreshIndicator(
                      onRefresh: () async => await context
                          .read(activeOrderProvider.notifier)
                          .retrieveActiveOrder(),
                      child: _buildOrderProductsList(context, order),
                    ),
                    if (deliveryDetail.fullfiled())
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                          child: ConfirmOrderButton(
                            price: (order.products_price ?? 0) +
                                (deliveryDetail.deliveryPrice ?? 0),
                          ),
                        ),
                      )
                  ],
                ),
              )
            else
              Expanded(
                child: Center(
                  child: Text('Keranjang Kosong'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  VerticalScrollProductList _buildOrderProductsList(
    BuildContext context,
    Order order,
  ) {
    return VerticalScrollProductList(
      header: Column(
        children: [
          SelectOrderDeliveryLocationButton(),
          SizedBox(height: 10),
          OrderDeliveryAddressDetail(),
          SizedBox(height: 20.0),
        ],
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: _buildOrderDetail(order),
      ),
      padding: const EdgeInsets.fromLTRB(
        24.0,
        10.0,
        24.0,
        ConfirmOrderButton.height + 20,
      ),
      products: (order.order_items ?? []).map((item) => item.product!).toList(),
      onItemTap: (Product product) async {
        await context.read(mainPageController.notifier).setPage(0);

        Utils.homeNav.currentState!.pushNamed(
          '/home/stall',
          arguments: {
            'stall_id': product.stall_id,
          },
        );
      },
    );
  }

  Widget _buildOrderDetail(Order order) {
    final orderNotifier = useProvider(activeOrderProvider.notifier);
    final deliveryDetail = useProvider(deliveryDetailProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorPallete.lightGray.withOpacity(0.5),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total berat produk',
                style: kTextTheme.subtitle2!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              Text(
                '${(orderNotifier.totalProductWeight) / 1000} kg',
                textAlign: TextAlign.end,
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total harga produk',
                style: kTextTheme.subtitle2!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              Text(
                'Rp. ${Helper.fmtPrice(orderNotifier.totalProductPrice)}',
                textAlign: TextAlign.end,
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ongkos kirim',
                style: kTextTheme.subtitle2!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              Text(
                deliveryDetail.deliveryPrice != null
                    ? 'Rp. ${Helper.fmtPrice(deliveryDetail.deliveryPrice)}'
                    : '-',
                textAlign: TextAlign.end,
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Platform fee*',
                style: kTextTheme.subtitle2!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              Text(
                '-',
                textAlign: TextAlign.end,
              ),
            ],
          ),
          SizedBox(height: 16.0),
          DottedLine(
            dashColor: ColorPallete.lightGray,
          ),
          SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total harga',
                style: kTextTheme.headline6!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              // TODO: create API endpoint to calculate  price based on distance and item weight
              Text(
                'Rp. ${Helper.fmtPrice((orderNotifier.totalProductPrice) + (deliveryDetail.deliveryPrice ?? 0))}',
                textAlign: TextAlign.end,
                style: kTextTheme.subtitle1!.copyWith(
                  color: ColorPallete.primaryColor,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(String labelText) {
    return Container(
      height: 78.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPallete.backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: ColorPallete.lightGray.withOpacity(0.5),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '${labelText}',
          style: kTextTheme.headline2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class OrderDeliveryAddressDetail extends HookWidget {
  const OrderDeliveryAddressDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = useProvider(activeOrderProvider);
    final deliveryDetail = useProvider(deliveryDetailProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorPallete.lightGray.withOpacity(0.5),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Titik Antar',
                  style: kTextTheme.subtitle2!.copyWith(
                    color: ColorPallete.darkGray,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  deliveryDetail.geocodedPosition ?? '-',
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Alamat',
                style: kTextTheme.subtitle2!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              Text(
                order?.address ?? '-',
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SelectOrderDeliveryLocationButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final market = useProvider(currentMarketProvider).state;
    final deliveryDetail = useProvider(deliveryDetailProvider);
    final deliveryDetailNotifier = useProvider(deliveryDetailProvider.notifier);

    return SizedBox(
      height: 42.0,
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          'Pilih Lokasi Antar',
          style: kTextTheme.caption!.copyWith(
            color: deliveryDetail.fullfiled()
                ? ColorPallete.darkGray
                : ColorPallete.backgroundColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: deliveryDetail.fullfiled()
              ? ColorPallete.blueishGray
              : ColorPallete.primaryColor,
          elevation: 0,
        ),
        onPressed: () async {
          PermissionStatus permission =
              await LocationPermissions().requestPermissions();

          if (permission != PermissionStatus.granted) return;

          final List<String?> latLong = await TrustLocation.getLatLong;

          final double? lat = double.tryParse(latLong[0]!);
          final double? lng = double.tryParse(latLong[1]!);

          if (lat != null && lng != null) {
            final PlacePickerResult? result = await Utils.pickLocation(
              market,
              initialLocation: deliveryDetail.position ?? LatLng(lat, lng),
            );

            if (result != null) {
              deliveryDetailNotifier.setDeliveryLocation(result.target!);
              deliveryDetailNotifier.setDeliveryPrice(100000);
            }
          }
          // Handle the result in your way
          // print(result);
        },
      ),
    );
  }
}
