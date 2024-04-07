import 'package:flutter/material.dart';
import '../models/Truck.dart';
import '../widgets/TruckCard.dart';

class TruckMarkerInfoWindow extends StatelessWidget {
  final Truck truck;

  const TruckMarkerInfoWindow({Key? key, required this.truck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 8),
          Center(
            child: Text(
              truck.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTruckCard(context, truck),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
