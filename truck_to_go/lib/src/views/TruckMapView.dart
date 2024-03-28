import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:truck_to_go/src/widgets/Footer.dart';
import 'package:truck_to_go/src/views/TruckListView.dart';

import '../models/Truck.dart';

class MapView extends StatefulWidget {
  final List<Truck> trucks; // Add this line to accept the list of trucks
  MapView({required this.trucks}); // Add this line to accept the list of trucks

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late GoogleMapController mapController;

  //Initial Map Center, Capitole Toulouse
  //To be changed with user's location
  final LatLng _center = const LatLng(43.604478, 1.443372);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Trucks near you'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: _createMarkers(), //This line calls the method below to add markers
      ),
      bottomNavigationBar: Footer(
        onMapPressed: () {
          //Already in map view
        },
        onListPressed: () {
          //Navigate to the list view
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return widget.trucks.map((truck) {
      return Marker(
        markerId: MarkerId(truck.name),
        position: LatLng(truck.geolocation.latitude, truck.geolocation.longitude),
        infoWindow: InfoWindow(
          title: truck.name,
          snippet: truck.description,
        ),
      );
    }).toSet();
  }
}

