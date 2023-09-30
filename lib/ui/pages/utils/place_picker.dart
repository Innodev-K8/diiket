
import 'package:diiket/data/network/directions_service.dart';
import 'package:diiket/data/network/geocode_service.dart';
import 'package:diiket/data/providers/location/device_location_provider.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket_core/diiket_core.dart';
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

  // the center of the map
  LatLng? _lastMapPosition;

  bool _isLoading = true;

  BitmapDescriptor? marketIcon;
  BitmapDescriptor? userIcon;

  @override
  void initState() {
    super.initState();

    _loadCustomIcons();

    _pickedPosition = widget.initialPosition;

    _marketPosition = LatLng(
      double.tryParse(widget.market.locationLat ?? '0') ?? 0,
      double.tryParse(widget.market.locationLng ?? '0') ?? 0,
    );

    if (_pickedPosition != null) _setPickedPosition();
  }

  Future<void> _loadCustomIcons() async {
    marketIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        size: Size(18, 18),
      ),
      'assets/images/map/market_map_icon.png',
    );
    userIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        size: Size(10, 10),
      ),
      'assets/images/map/user_map_icon.png',
    );

    setState(() {});
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

    // get the services
    final directionService = context.read(directionsServiceProvider);
    final gecodingService = context.read(geocodeServiceProvider);

    final destinationPosition = _lastMapPosition ?? _pickedPosition!;

    final Directions? directions = await directionService.getDirections(
      origin: _marketPosition,
      destination: destinationPosition,
    );

    final Placemark? placemark =
        await gecodingService.reverseGeocoding(destinationPosition);

    // when we doesn't get anyting from the direction service eg: cant find routes
    if (directions?.bounds == null) {
      Utils.alert('Terjadi kesalahan, harap coba lagi');

      return setState(() {
        _pickedPosition = null;
        _directions = null;
        _isLoading = false;
      });
    }

    await _controller?.animateCamera(
      CameraUpdate.newLatLngBounds(directions!.bounds!, 80),
    );

    setState(() {
      _directions = directions!.copyWith(
        placemark: placemark,
      );
      _isLoading = false;
    });
  }

  void _onCameraMove(CameraPosition position) {
    // track middle position to  consume when user clicks confirm
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    final paceName = _directions?.placemark?.subLocality;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(
              paceName ??
                  (_directions == null
                      ? 'Pilih Alamat Kirim'
                      : 'Alamat tidak diketahui'),
            ),
            Expanded(
              child: Stack(
                children: [
                  _buildMap(),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 1200),
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                    ) {
                      return FadeTransition(
                        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Interval(0.8, 1.0),
                          ),
                        ),
                        child: child,
                      );
                    },
                    child: _pickedPosition == null
                        ? _buildMapPointer()
                        : SizedBox(),
                  ),
                  if (_isLoading) _buildLoading(),
                ],
              ),
            ),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Padding(
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

                  setState(() {
                    _pickedPosition = null;
                    _directions = null;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPallete.secondaryColor,
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
                  ),);
                } else {
                  _setPickedPosition();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPallete.primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: Text(_pickedPosition != null ? 'Konfirmasi' : 'Pilih'),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildLoading() {
    return Container(
      color: Colors.black.withOpacity(0.1),
      child: Center(
        child: CircularProgressIndicator(
          color: ColorPallete.secondaryColor,
        ),
      ),
    );
  }

  Widget _buildMap() {
    return Consumer(
      builder: (context, watch, child) {
        final userPosition = watch(deviceLocationProvider);

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
                markerId: MarkerId('picked-position'),
                position: _pickedPosition!,
              ),
            if (userIcon != null)
              Marker(
                markerId: MarkerId('user-position'),
                position: userPosition,
                anchor: Offset(0.5, 0.5),
                icon: userIcon!,
              ),
            if (marketIcon == null)
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
                icon: marketIcon!,
              ),
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
      },
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
                style: kTextTheme.titleSmall!.copyWith(
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
                style: kTextTheme.titleSmall!.copyWith(
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
          style: kTextTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildMapPointer() {
    return Center(
      child: Transform.translate(
        offset: Offset(0, -48 / 2),
        child: Icon(
          Icons.location_on_outlined,
          color: ColorPallete.primaryColor,
          size: 48,
        ),
      ),
    );
  }
}
