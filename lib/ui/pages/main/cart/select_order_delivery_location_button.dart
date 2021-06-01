import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/utils/place_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:trust_location/trust_location.dart';

class SelectOrderDeliveryLocationButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final deliveryDetail = useProvider(deliveryDetailProvider);

    return SizedBox(
      height: 42.0,
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          'Pilih Lokasi Antar',
          style: kTextTheme.caption!.copyWith(
            color: deliveryDetail.position != null
                ? ColorPallete.darkGray
                : ColorPallete.backgroundColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: deliveryDetail.position != null
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
              context.read(currentMarketProvider).state,
              initialLocation: deliveryDetail.position ?? LatLng(lat, lng),
            );

            if (result != null) {
              context
                  .read(deliveryDetailProvider.notifier)
                  .setDeliveryDirections(result.target, result.directions);

              context.read(deliveryDetailProvider.notifier).calculateFare();
            }
          }
          // Handle the result in your way
          // print(result);
        },
      ),
    );
  }
}
