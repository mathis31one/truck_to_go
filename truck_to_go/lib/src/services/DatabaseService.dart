import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:truck_to_go/src/models/Truck.dart';

class DatabaseService {
  // Load dummy data from a JSON file
  Future<List<Truck>> getTrucks() async {
    // Read JSON file from assets
    String jsonString = await rootBundle.loadString('assets/data/data.json');

    // Parse JSON data
    List<dynamic> jsonList = json.decode(jsonString);

    // Map JSON data to Truck objects
    List<Truck> trucks = jsonList.map((json) => Truck.fromJson(json)).toList();

    return trucks;
  }
}
