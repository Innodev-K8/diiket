import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket/data/services/location_service.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/utils/place_picker.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectOrderDeliveryLocationButton extends HookWidget {
  final Function? onLoading;
  final Function? onDone;

  const SelectOrderDeliveryLocationButton({
    this.onLoading,
    this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    final deliveryDetail = useProvider(deliveryDetailProvider).state;

    return SizedBox(
      height: 42.0,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: deliveryDetail?.position != null
              ? ColorPallete.secondaryColor
              : ColorPallete.primaryColor,
          elevation: 0,
        ),
        onPressed: () async {
          onLoading?.call();

          try {
            final Market? currentMarket =
                context.read(currentMarketProvider).state;

            if (currentMarket == null) {
              return;
            }

            final LatLng? initialLocation = deliveryDetail?.position ??
                await LocationService.getUserPosition();

            if (initialLocation != null) {
              final PlacePickerResult? result = await Utils.pickLocation(
                currentMarket,
                initialLocation: initialLocation,
              );

              if (result != null) {
                final placeMark = result.directions?.placemark;

                final String? subLocality = placeMark?.subLocality;
                final String? locality = placeMark?.locality;
                final String? administrativeArea =
                    placeMark?.administrativeArea;
                final String? postalCode = placeMark?.postalCode;

                final String geocodedPosition =
                    "${subLocality ?? '-'}, ${locality ?? '-'}, ${administrativeArea ?? '-'} ${postalCode ?? '-'}";
                final String address =
                    placeMark?.street?.toLowerCase().startsWith('jl') == true
                        ? placeMark!.street!
                        : geocodedPosition;

                final deliveryDetail = DeliveryDetail(
                  position: result.target,
                  directions: result.directions,
                  geocodedPosition: geocodedPosition,
                  address: address,
                );

                context.read(deliveryDetailProvider).state = deliveryDetail;
              }
            }
          } finally {
            onDone?.call();
          }
        },
        child: Text(
          'Pilih ${deliveryDetail?.position != null ? 'Ulang ' : ''}Lokasi Antar',
          style: kTextTheme.caption!.copyWith(
            color: ColorPallete.backgroundColor,
          ),
        ),
      ),
    );
  }
}
