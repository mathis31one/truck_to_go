import 'package:flutter/material.dart';
import 'package:truck_to_go/src/models/Truck.dart';
import 'package:truck_to_go/src/views/TruckDetailView.dart';

Widget buildTruckCard(BuildContext context, Truck truck) {
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
                    style: const TextStyle(
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