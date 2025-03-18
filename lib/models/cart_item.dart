import 'food.dart';

class CartItem {
  Food food;
  List<Addon> selectAddons;
  int quantity;

  CartItem({
    required this.food,
    this.quantity =1,
    required this.selectAddons,
});

  double get totalPrice{
    double addonsPrice =
        selectAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity;
  }
}