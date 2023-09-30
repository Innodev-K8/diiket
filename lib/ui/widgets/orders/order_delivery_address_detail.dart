import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/ui/pages/main/profile/settings/name_setting_page.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderDeliveryAddressDetail extends HookWidget {
  const OrderDeliveryAddressDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeOrder = useProvider(activeOrderProvider);
    final deliveryDetail = useProvider(deliveryDetailProvider).state;
    final addressController =
        useTextEditingController(text: deliveryDetail?.address);

    useEffect(() {
      addressController.text = deliveryDetail?.address ?? '';
      return null;
    }, [deliveryDetail],);

    final editable = activeOrder?.status == OrderStatus.unconfirmed;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorPallete.lightGray.withOpacity(0.5),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (editable) ...[
            _buildItem(
              'Titik Antar',
              deliveryDetail?.geocodedPosition ?? '-',
            ),
            SizedBox(height: 16),
            Text(
              'Alamat',
              style: kTextTheme.titleSmall!.copyWith(
                color: ColorPallete.darkGray,
              ),
            ),
            SizedBox(height: 8),
            BorderedCustomTextFormField(
              controller: addressController,
              minLines: 1,
              maxLines: 5,
            ),
            SizedBox(height: 2),
            Text(
              'Tuliskan alamat lengkap untuk memudahkan Driver menemukan lokasi Anda.',
              style: kTextTheme.labelSmall!.copyWith(
                color: ColorPallete.darkGray,
              ),
            ),
          ] else ...[
            _buildItem(
              'Alamat Antar',
              activeOrder?.address ?? '-',
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: kTextTheme.titleSmall!.copyWith(
              color: ColorPallete.darkGray,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
