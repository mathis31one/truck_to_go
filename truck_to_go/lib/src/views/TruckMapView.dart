import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:truck_to_go/src/views/TruckListView.dart';
import 'package:truck_to_go/src/widgets/Footer.dart';
import '../models/Truck.dart';
import '../widgets/TruckMarkerInfoWindow.dart';

class TruckMapView extends StatefulWidget {
  final List<Truck> trucks;
  const TruckMapView({Key? key, required this.trucks}) : super(key: key);

  static const routeName = '/map';

  @override
  _TruckMapViewState createState() => _TruckMapViewState();
}

class _TruckMapViewState extends State<TruckMapView> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(43.604478, 1.443372);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

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
        markers: _createMarkers(),
      ),
      bottomNavigationBar: Footer(
        currentView: CurrentView.mapView,
        onMapPressed: () {},
        onListPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TruckListView(trucks: widget.trucks),
            ),
          );
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
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return TruckMarkerInfoWindow(truck: truck);
            },
          );
        }
      );
    }).toSet();
  }
}
