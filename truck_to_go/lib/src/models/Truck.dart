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
}

class Geolocation {
  final double latitude;
  final double longitude;

  Geolocation({
    required this.latitude,
    required this.longitude,
  });
}
