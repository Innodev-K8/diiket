import 'package:diiket/data/models/directions.dart';
import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/network/directions_service.dart';
import 'package:diiket/data/network/geocode_service.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlacePickerResult {
  final Directions? directions;
  final LatLng? target;

  PlacePickerResult({
    this.directions,
    this.target,
  });
}

class PlacePicker extends StatefulWidget {
  final Market market;
  final LatLng? initialPosition;

  const PlacePicker({
    Key? key,
    required this.market,
    this.initialPosition,
  }) : super(key: key);

  @override
  _PlacePickerState createState() => _PlacePickerState();
}

class _PlacePickerState extends State<PlacePicker> {
  late LatLng? _pickedPosition;
  late LatLng _marketPosition;

  GoogleMapController? _controller;
  Directions? _directions;
  LatLng? _lastMapPosition;

  bool _isLoading = true;

  BitmapDescriptor? customIcon;

  @override
  void initState() {
    super.initState();

    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        size: Size(18, 18),
      ),
      'assets/images/map/market_map_icon.png',
    ).then((d) {
      setState(() {
        customIcon = d;
      });
    });

    _pickedPosition = widget.initialPosition;

    _marketPosition = LatLng(
      double.tryParse(widget.market.locationLat ?? '0') ?? 0,
      double.tryParse(widget.market.locationLng ?? '0') ?? 0,
    );

    if (_pickedPosition != null) _setPickedPosition();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _setPickedPosition() async {
    setState(() {
      _isLoading = true;
    });

    _pickedPosition = _lastMapPosition ?? _pickedPosition;

    if (_pickedPosition == null) return;

    final destinationPosition = _lastMapPosition ?? _pickedPosition!;

    final Directions? directions =
        await context.read(directionsServiceProvider).getDirections(
              origin: _marketPosition,
              destination: destinationPosition,
            );

    final Placemark? placemark = await context
        .read(geocodeServiceProvider)
        .reverseGeocoding(destinationPosition);

    if (directions?.bounds == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan, harap coba lagi'),
        ),
      );

      return setState(() {
        _pickedPosition = null;
        _directions = null;
        _isLoading = false;
      });
    }

    await _controller
        ?.animateCamera(CameraUpdate.newLatLngBounds(directions!.bounds!, 80));

    setState(() {
      _directions = directions!.copyWith(
        placemark: placemark,
      );
      _isLoading = false;
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(
              _directions?.placemark?.subLocality != null
                  ? _directions!.placemark!.subLocality!
                  : _directions != null
                      ? 'Alamat tidak diketahui'
                      : 'Pilih Alamat Kirim',
            ),
            Expanded(
              child: Stack(
                children: [
                  _buildMap(),
                  if (_pickedPosition == null)
                    Center(
                      child: Transform.translate(
                        offset: Offset(0, -48 / 2),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: ColorPallete.primaryColor,
                          size: 48,
                        ),
                      ),
                    ),
                  if (_isLoading)
                    Container(
                      color: Colors.black.withOpacity(0.1),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorPallete.secondaryColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  if (_pickedPosition != null &&
                      _directions?.totalDistance != null) ...[
                    _buildShipmentInfo(),
                    SizedBox(height: 8.0),
                  ],
                  if (_pickedPosition != null) ...[
                    SizedBox(
                      width: double.infinity,
                      height: 38,
                      child: ElevatedButton(
                        onPressed: () async {
                          await _controller?.animateCamera(
                            CameraUpdate.newLatLng(_pickedPosition!),
                          );

                          // wait for camera animation
                          await Future.delayed(Duration(seconds: 1));

                          setState(() {
                            _pickedPosition = null;
                            _directions = null;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: ColorPallete.secondaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: Text('Pilih Ulang'),
                      ),
                    ),
                    SizedBox(height: 8.0),
                  ],
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pickedPosition != null) {
                          Utils.popPlacePicker(PlacePickerResult(
                            directions: _directions,
                            target: _pickedPosition,
                          ));
                        } else {
                          _setPickedPosition();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: ColorPallete.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Text(
                          _pickedPosition != null ? 'Konfirmasi' : 'Pilih'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GoogleMap _buildMap() {
    return GoogleMap(
      buildingsEnabled: false,
      initialCameraPosition: CameraPosition(
        target: widget.initialPosition ?? LatLng(0.7893, 113.9213),
        zoom: 16.0,
      ),
      onCameraMove: _onCameraMove,
      onMapCreated: (controller) => _controller = controller,
      markers: {
        if (_pickedPosition != null)
          Marker(
            markerId: MarkerId('user-position'),
            position: _pickedPosition!,
          ),
        if (customIcon == null)
          Marker(
            markerId: MarkerId('market-position'),
            position: _marketPosition,
            anchor: Offset(0.5, 0.5),
          )
        else
          Marker(
            markerId: MarkerId('market-position'),
            position: _marketPosition,
            anchor: Offset(0.5, 0.5),
            icon: customIcon!,
          )
      },
      polylines: {
        if (_directions != null)
          Polyline(
            polylineId: PolylineId('shipment-route'),
            color: ColorPallete.primaryColor,
            width: 6,
            endCap: Cap.roundCap,
            points: _directions!.polylinePoints
                    ?.map((e) => LatLng(e.latitude, e.longitude))
                    .toList() ??
                [],
          ),
      },
      zoomControlsEnabled: false,
    );
  }

  Container _buildShipmentInfo() {
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
                'Jarak',
                style: kTextTheme.subtitle2!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              Text(
                '${(_directions!.totalDistance! / 1000).toStringAsFixed(2)} km',
                textAlign: TextAlign.end,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Estimasi Pengiriman',
                style: kTextTheme.subtitle2!.copyWith(
                  color: ColorPallete.darkGray,
                ),
              ),
              Text(
                '${(_directions!.totalDuration! / 60).toStringAsFixed(0)} menit',
                textAlign: TextAlign.end,
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
          labelText,
          style: kTextTheme.headline2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
