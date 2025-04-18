//food item
// ignore_for_file: constant_identifier_names

class Food {
  final String name; // cheese burger
  final String description;  // a burger full of cheese
  final String imagePath;    //assets/images/cheese_burger.png
  late final double price;      // 170
  final FoodCategory category; //burger
  List<Addon> availableAddons;  //[extra cheese, sauce]

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons });
}
//Food Categories
enum  FoodCategory{
  Burgers,
  Salads,
  Sides,
  Desserts,
  Pizzas,
  Drinks,
}

//food addons
class Addon {
  String name;
  double price;

  Addon({required this.name, required this.price,});
}
