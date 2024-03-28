class FoodItem {
  final String title;
  final String description;
  final double price;

  FoodItem(
      {required this.title, required this.description, required this.price});

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(), // Assuming price is a double
    );
  }
}
