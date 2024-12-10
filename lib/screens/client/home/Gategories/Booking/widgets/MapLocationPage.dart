// ignore_for_file: file_names, use_super_parameters, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLocationPage extends StatefulWidget {
  const MapLocationPage({Key? key}) : super(key: key);

  @override
  State<MapLocationPage> createState() => _MapLocationPageState();
}

class _MapLocationPageState extends State<MapLocationPage> {
  GoogleMapController? googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Position? position;

  Future<void> _getMarkers(double lat, double lng, String address) async {
    MarkerId markerId = MarkerId('$lat$lng');
    Marker marker = Marker(
      markerId: markerId,
      position: LatLng(lat, lng),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(title: "Your Address", snippet: address),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location services are disabled.')),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied.')),
        );
        return;
      }
    }

    Position currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      position = currentPosition;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map Location"),
        backgroundColor: Colors.blueAccent,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: position == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(position!.latitude, position!.longitude),
                zoom: 15.0,
              ),
              markers: Set<Marker>.of(markers.values),
              onTap: (LatLng tappedPoint) async {
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  tappedPoint.latitude,
                  tappedPoint.longitude,
                );
                if (placemarks.isNotEmpty) {
                  String address = placemarks.first.street ?? "Unknown Location";
                  _getMarkers(
                      tappedPoint.latitude, tappedPoint.longitude, address);

                  FirebaseFirestore.instance
                      .collection('booking_list')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .set({
                    'latitude': tappedPoint.latitude,
                    'longitude': tappedPoint.longitude,
                    'address': address,
                  });
                }
              },
            ),
    );
  }
}
