import 'FoodItem.dart';

class Truck {
  final String name;
  final String description;
  final Geolocation geolocation;
  final List<FoodItem> foodItems;

  Truck({
    required this.name,
    required this.description,
    required this.geolocation,
    required this.foodItems,
  });

  factory Truck.fromJson(Map<String, dynamic> json) {
    // Parse geolocation field
    final geolocationJson = json['geolocation'];
    final geolocation = Geolocation(
      latitude: geolocationJson['latitude'],
      longitude: geolocationJson['longitude'],
    );

    // Parse foodItems field
    final List<dynamic> foodItemsJson = json['foodItems'];
    final List<FoodItem> foodItems = foodItemsJson.map((itemJson) => FoodItem.fromJson(itemJson)).toList();

    return Truck(
      name: json['name'],
      description: json['description'],
      geolocation: geolocation,
      foodItems: foodItems,
    );
  }
}

class Geolocation {
  final double latitude;
  final double longitude;

  Geolocation({
    required this.latitude,
    required this.longitude,
  });

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
