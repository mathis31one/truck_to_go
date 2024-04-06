import 'package:flutter/material.dart';
import '../models/Truck.dart';

class TruckDetailView extends StatelessWidget {
  final Truck truck;

  const TruckDetailView({Key? key, required this.truck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(truck.name),
      ),
      body: ListView(
        children: [
          // Truck Image
          Container(
            width: double.infinity,
            height: 200, // Adjust height as needed
            child: Image.network(
              // Replace with actual image URL from truck data
              truck.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Food Items List
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Food Items:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                // List of Food Items
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: truck.foodItems.length,
                  itemBuilder: (context, index) {
                    var foodItem = truck.foodItems[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodItem.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(foodItem.description),
                        SizedBox(height: 4),
                        Text('Price: ${foodItem.price.toStringAsFixed(2)}\€'),
                        Divider(), // Add a divider between food items
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
