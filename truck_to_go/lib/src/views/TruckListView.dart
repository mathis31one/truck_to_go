import 'package:flutter/material.dart';
import 'package:truck_to_go/src/views/TruckMapView.dart';


import 'package:truck_to_go/src/widgets/Footer.dart';

import '../models/Truck.dart';
import 'TruckDetailView.dart';

class TruckListView extends StatefulWidget {
  final List<Truck> trucks;
  const TruckListView({super.key, required this.trucks});

  static const routeName = '/';

  @override
  _TruckListViewState createState() => _TruckListViewState();
}

class _TruckListViewState extends State<TruckListView> {
  String _sortBy = 'Distance'; // Default sorting criteria

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO remove AppBar to remove header
      appBar: AppBar(
        title: const Text('Truck List'),
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Location:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                const Text(
                  //TODO get location dynamically or have it be set by user
                  '24 rue Pargaminières, Toulouse 31000',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search food truck by name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(right: 8),
                      child: Text(
                        'Sort by:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      value: _sortBy,
                      onChanged: (newValue) {
                        setState(() {
                          _sortBy = newValue!;
                        });
                      },
                      items: <String>['Distance', 'Price'] // Add other sorting criteria as needed
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Truck List Section
          Expanded(
            child: ListView.builder(
              itemCount: widget.trucks.length,
              itemBuilder: (context, index) {
                return _buildTruckCard(context, widget.trucks[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(
        currentView: CurrentView.listView,
        onMapPressed: () {
          //Navigate to the map view
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TruckMapView(trucks: widget.trucks))
          );
        },
        onListPressed: () {
          // Already in list view
        },
      ),
    );
  }

  Widget _buildTruckCard(BuildContext context, Truck truck) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TruckDetailView(truck: truck),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8)
              ),
              child: Container(
                height: 140, // Set the height of the image section
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(truck.imageUrl), // Replace with actual image URL from truck data
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.black.withOpacity(0.5), // Add a semi-transparent background
                    child: Text(
                      truck.name, // Display truck name
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Distance and Price Texts
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //TODO method distance to develop
                  // Text('Distance: ${truck.distance}'),
                  Text('Distance: 200m'),
                  //TODO method avgPrice to develop
                  // Text('Avg. Price: \$${truck.avgPrice}'),
                  Text('Avg. Price: 13.99€'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}