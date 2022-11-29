import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoe_cart/view/Address/address_screen.dart';

List<Placemark> placeMark = [];

class MapLocationScreen extends StatefulWidget {
  const MapLocationScreen({super.key});
  static const CameraPosition camera = CameraPosition(
    target: LatLng(10.5483666, 76.2301987),
    zoom: 10,
  );

  @override
  State<MapLocationScreen> createState() => _MapLocationScreenState();
}

class _MapLocationScreenState extends State<MapLocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  List<Marker> locationMarker = [
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(10.5483666, 76.2301987),
      infoWindow: InfoWindow(title: 'location'),
    ),
  ];

  Future<Position> getCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('error $error');
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    getMyLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: MapLocationScreen.camera,
        markers: Set<Marker>.of(locationMarker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  getMyLocation() {
    getCurrentLocation().then((value) async {
      locationMarker.add(
        Marker(
            markerId: const MarkerId('2'),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: const InfoWindow(title: 'My current Location')),
      );
      CameraPosition camPosition = CameraPosition(
        zoom: 14,
        target: LatLng(value.latitude, value.longitude),
      );
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(camPosition),
      );

      placeMark = await GeocodingPlatform.instance
          .placemarkFromCoordinates(value.latitude, value.longitude);

      // await placemarkFromCoordinates(value.latitude, value.longitude,
      //     localeIdentifier: 'en');
      Get.off(() => AddressScreen());

      setState(() {});
    });
  }
}
