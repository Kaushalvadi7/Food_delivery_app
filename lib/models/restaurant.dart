import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:intl/intl.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier{
  //list of food menu
  final List<Food> _menu  =[
    //burgers
    Food(name:"Aloha Burger" ,
        description: "Step into a tropical paradise with the Aloha Burger. Grilled pineapple, smoky ham, and a tangy teriyaki glaze combine for a burst of sweet and savory flavors that make each bite feel like a vacation",
        imagePath:'assets/images/Burgers/aloha_burger.png',
        price: 159,
        category: FoodCategory.Burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 20),
          Addon(name: "Bacon", price: 30),
          Addon(name: "Extra Avocado", price: 50),
        ]),
    Food(name:"Blue Moon Burger" ,
        description: "Indulge in a flavor adventure with the Blue Moon Burger. Creamy blue cheese sauce, crispy bacon, and peppery arugula offer an exciting combination that’s rich, smoky, and perfectly balanced.",
        imagePath:"assets/images/Burgers/blueMoon_buger.png" ,
        price: 199,
        category: FoodCategory.Burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 20),
          Addon(name: "Bacon", price: 30),
          Addon(name: "Extra Avocado", price: 50),
        ]),
    Food(name:"BBQ Burger" ,
        description: "This isn't just any burger; it's a smoky masterpiece. Slow-cooked barbecue sauce, caramelized onions, and a generous helping of tangy pickles create a flavor explosion in every bite.",
        imagePath:"assets/images/Burgers/bbq_burger.png" ,
        price: 229,
        category: FoodCategory.Burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 20),
          Addon(name: "Bacon", price: 30),
          Addon(name: "Extra Avocado", price: 50),
        ]),
    Food(name:"Ultimate Cheeseburger" ,
        description: "For the ultimate cheese lover, this burger is a dream come true. A blend of sharp cheddar, creamy brie, and tangy blue cheese offers a decadent, cheesy explosion in every bite.",
        imagePath:"assets/images/Burgers/Ultimate_Cheeseburger.png" ,
        price: 189,
        category: FoodCategory.Burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 20),
          Addon(name: "Bacon", price: 30),
          Addon(name: "Extra Avocado", price: 50),
        ]),
    Food(name:"Veg Burger" ,
        description: "This Veg Burger is a celebration of fresh, vibrant flavors. With a juicy plant-based patty, crisp lettuce, tomato, and a creamy avocado spread, it’s a satisfying choice for both vegetarians and meat lovers alike.",
        imagePath:"assets/images/Burgers/veg_burger.png",
        price: 119,
        category: FoodCategory.Burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 20),
          Addon(name: "Bacon", price: 30),
          Addon(name: "Extra Avocado", price: 50),
        ]),

    //pizzas

    Food(name:"Veggie Supreme Pizza(Medium)" ,
        description: "A colorful mix of bell peppers, olives, mushrooms, onions, and corn on a cheesy, crispy crust.",
        imagePath:"assets/images/Pizzas/veggie_supreme_pizza.jpg",
        price: 499,
        category: FoodCategory.Pizzas,
        availableAddons: [
          Addon(name: "Extra Chilli Flakes", price: 30),
          Addon(name: "Extra Mayo", price: 40),
          Addon(name: "Extra Cheese", price: 50),
        ]),
    Food(name:"Margherita Pizza(Medium)" ,
        description: "A timeless Italian classic with fresh tomato sauce, mozzarella cheese, and aromatic basil leaves.",
        imagePath:"assets/images/Pizzas/Margherita_pizza.jpg",
        price: 329,
        category: FoodCategory.Pizzas,
        availableAddons: [
          Addon(name: "Extra Chilli Flakes", price: 30),
          Addon(name: "Extra Mayo", price: 40),
          Addon(name: "Extra Cheese", price: 50),
        ]),
    Food(name:"Four Cheese Pizza (Medium)" ,
        description: "A cheese lover’s dream—mozzarella, cheddar, parmesan, and blue cheese blended to perfection.",
        imagePath:"assets/images/Pizzas/Four_cheese_pizza.png",
        price: 499,
        category: FoodCategory.Pizzas,
        availableAddons: [
          Addon(name: "Extra Chilli Flakes", price: 30),
          Addon(name: "Extra Mayo", price: 40),
          Addon(name: "Extra Cheese", price: 50),
        ]),
    Food(name:"Cosmic Inferno Pizza (Medium)" ,
        description: "A fiery delight loaded with spicy pepperoni, jalapeños, chili flakes, and a drizzle of hot sauce.",
        imagePath:"assets/images/Pizzas/Cosmic Inferno Pizza.png",
        price: 449,
        category: FoodCategory.Pizzas,
        availableAddons: [
          Addon(name: "Extra Chilli Flakes", price: 30),
          Addon(name: "Extra Mayo", price: 40),
          Addon(name: "Extra Cheese", price: 50),
        ]),
    Food(name:"Chicago Pizza (Medium)" ,
        description: "A deep-dish classic with layers of rich tomato sauce, melted cheese, and a thick, buttery crust.",
        imagePath:"assets/images/Pizzas/Chicago_pizza.png",
        price: 379,
        category: FoodCategory.Pizzas,
        availableAddons: [
          Addon(name: "Extra Chilli Flakes", price: 30),
          Addon(name: "Extra Mayo", price: 40),
          Addon(name: "Extra Cheese", price: 50),
        ]),
    Food(name:"BBQ Pizza (Medium)" ,
        description: "Smoky BBQ sauce, tender grilled chicken, caramelized onions, and gooey cheese on a crispy crust.",
        imagePath:"assets/images/Pizzas/Bbq_pizza.png",
        price: 599,
        category: FoodCategory.Pizzas,
        availableAddons: [
          Addon(name: "Extra Chilli Flakes", price: 30),
          Addon(name: "Extra Mayo", price: 40),
          Addon(name: "Extra Cheese", price: 50),
        ]),

    //salads

    Food(name:"Southwest Salad" ,
        description: "A bold mix of black beans, corn, bell peppers, and avocado, topped with a smoky chipotle dressing.",
        imagePath:"assets/images/Salads/Southwest_salad.png",
        price: 199,
        category: FoodCategory.Salads,
        availableAddons: [
          Addon(name: "Roasted Nuts", price: 30),
          Addon(name: "Croutons", price: 40),
          Addon(name: "Extra Avocado", price: 50),
        ]),
    Food(name:"Quinoa Salad" ,
        description: "Protein-packed quinoa with fresh veggies, nuts, and a light lemon vinaigrette for a healthy bite.",
        imagePath:"assets/images/Salads/Quinoa_salad.png",
        price: 179,
        category: FoodCategory.Salads,
        availableAddons: [
          Addon(name: "Roasted Nuts", price: 30),
          Addon(name: "Croutons", price: 40),
          Addon(name: "Extra Avocado", price: 50),
        ]),
    Food(name:"Asian Sesame Salad" ,
        description: "A refreshing mix of crisp greens, crunchy almonds, and sesame seeds, tossed in a tangy sesame dressing.",
        imagePath:"assets/images/Salads/Asiansesame_salad.jpg",
        price: 239,
        category: FoodCategory.Salads,
        availableAddons: [
          Addon(name: "Roasted Nuts", price: 30),
          Addon(name: "Croutons", price: 40),
          Addon(name: "Extra Avocado", price: 50),
        ]),
    Food(name:"Caesar Salad" ,
        description: "Classic romaine lettuce with parmesan, crunchy croutons, and creamy Caesar dressing.",
        imagePath:"assets/images/Salads/Caeser_salad.png",
        price: 179,
        category: FoodCategory.Salads,
        availableAddons: [
          Addon(name: "Roasted Nuts", price: 30),
          Addon(name: "Croutons", price: 40),
          Addon(name: "Extra Avocado", price: 50),
        ]),
    Food(name:"Greek Salad" ,
        description: "A Mediterranean delight with cucumbers, tomatoes, feta cheese, olives, and a zesty olive oil dressing.",
        imagePath:"assets/images/Salads/Greek_salad.png",
        price: 189,
        category: FoodCategory.Salads,
        availableAddons: [
          Addon(name: "Roasted Nuts", price: 30),
          Addon(name: "Croutons", price: 40),
          Addon(name: "Extra Avocado", price: 50),
        ]),

    //sides

    Food(name:"Garlic Sides" ,
        description: "Crispy, golden bites infused with rich garlic butter, served with a side of tangy dip.",
        imagePath:"assets/images/Sides/Garlic_sides.jpg",
        price: 199,
        category: FoodCategory.Sides,
        availableAddons: [
          Addon(name: "Extra Chilli Flakes", price: 20),
          Addon(name: "Spicy Mayo", price: 30),
          Addon(name: "Extra Cheese", price: 40),
        ]),
    Food(name:"Loaded Fries" ,
        description: "Crispy fries topped with gooey cheese, jalapeños, and a drizzle of flavorful sauces for the ultimate",
        imagePath:"assets/images/Sides/Loaded_fries.png",
        price: 159,
        category: FoodCategory.Sides,
        availableAddons: [
          Addon(name: "Extra Chilli Flakes", price: 20),
          Addon(name: "Spicy Mayo", price: 30),
          Addon(name: "Extra Cheese", price: 40),
        ]),
    Food(name:"Mac Sides" ,
        description: "Creamy, cheesy macaroni with a rich, buttery texture—perfect as a comforting side dish.",
        imagePath:"assets/images/Sides/mac_sides.jpg",
        price: 179,
        category: FoodCategory.Sides,
        availableAddons: [
          Addon(name: "Extra Chilli Flakes", price: 20),
          Addon(name: "Spicy Mayo", price: 30),
          Addon(name: "Extra Cheese", price: 40),
        ]),
    Food(name:"Onion Rings" ,
        description: "Crispy, golden-fried onion rings with a light crunch, served with a zesty dipping sauce.",
        imagePath:"assets/images/Sides/Onion_rings.png",
        price: 149,
        category: FoodCategory.Sides,
        availableAddons: [
          Addon(name: "Extra Chilli Flakes", price: 20),
          Addon(name: "Spicy Mayo", price: 30),
          Addon(name: "Extra Cheese", price: 40),
        ]),
    Food(name:"Sweet Potato" ,
        description: "Perfectly baked or fried sweet potato wedges, lightly seasoned for a sweet and savory treat.",
        imagePath:"assets/images/Sides/Sweet_potato_side.jpg",
        price: 139,
        category: FoodCategory.Sides,
        availableAddons: [
          Addon(name: "Extra Chilli Flakes", price: 20),
          Addon(name: "Spicy Mayo", price: 30),
          Addon(name: "Extra Cheese", price: 40),
        ]),

    //desserts
    Food(name:"Chocolate Lava Cake" ,
        description: "Prepare for a warm, gooey surprise with every spoonful of our Chocolate Lava Cake. As you break through the soft outer shell, a molten chocolate center flows out, delivering pure indulgence in every bite.",
        imagePath:"assets/images/Desserts/Chocolate_lava_cake.png" ,
        price: 200,
        category: FoodCategory.Desserts,
        availableAddons: [
          Addon(name: "Extra Nuts", price: 20),
          Addon(name: "Chocolate Syrup", price: 30),
          Addon(name: "Whipped Cream", price: 30),
          Addon(name: "Caramel Drizzle", price: 40),
        ]),
    Food(name:"Cheesecake" ,
        description: "Indulge in a creamy, velvety slice of heaven. This cheesecake boasts a rich, smooth texture with just the right amount of sweetness, set atop a buttery, crumbly base. It’s the perfect way to end any meal.",
        imagePath:"assets/images/Desserts/Cheesecake.jpg" ,
        price: 180,
        category: FoodCategory.Desserts,
        availableAddons: [
          Addon(name: "Extra Nuts", price: 20),
          Addon(name: "Chocolate Syrup", price: 30),
          Addon(name: "Whipped Cream", price: 30),
          Addon(name: "Caramel Drizzle", price: 40),
        ]),
    Food(name:"Tiramisu" ,
        description: "A delicate Italian classic, Tiramisu layers rich coffee-soaked ladyfingers with a luscious mascara cream, dusted with cocoa powder for a flavor experience that’s both rich and light at the same time.",
        imagePath:"assets/images/Desserts/Tiramisu.jpg" ,
        price: 159,
        category: FoodCategory.Desserts,
        availableAddons: [
          Addon(name: "Extra Nuts", price: 30),
          Addon(name: "Choco Chips", price: 30),
          Addon(name: "Whipped Cream", price: 30),
          Addon(name: "Extra Cocoa Powder Dusting", price: 30),
        ]),
    Food(name:"Gulab Jamun" ,
        description: "Soft, spongy, and soaked in aromatic sugar syrup, our Gulab Jamun offers the perfect blend of sweetness and warmth. A traditional Indian dessert that’s melt-in-your-mouth good.",
        imagePath:"assets/images/Desserts/Gulab_jamun.jpg" ,
        price: 129,
        category: FoodCategory.Desserts,
        availableAddons: [
          Addon(name: "Rose Petals", price: 20),
          Addon(name: "Vanilla Ice Cream", price: 20),
          Addon(name: "Chopped Pistachios", price: 30),
        ]),
    Food(name:"Fruit Tart" ,
        description: "A refreshing and vibrant treat, the Fruit Tart features a crisp, buttery pastry crust filled with creamy custard, topped with a colorful assortment of fresh, juicy fruits. A delightful balance of sweetness and tartness.",
        imagePath:"assets/images/Desserts/Fruit_tart.jpg" ,
        price: 199,
        category: FoodCategory.Desserts,
        availableAddons: [
          Addon(name: "Extra Nuts", price: 20),
          Addon(name: "Chocolate Syrup", price: 30),
          Addon(name: "Whipped Cream", price: 30),
          Addon(name: "Caramel Drizzle", price: 40),
        ]),

    //drinks

    Food(name:"Virgin Mojito" ,
        description: "A classic mint and lime cooler with fizzy soda, crushed ice, and a touch of sweetness for a crisp and refreshing experience.",
        imagePath:"assets/images/Drinks/Virgin_mojito.png",
        price: 110,
        category: FoodCategory.Drinks,
        availableAddons: [
          Addon(name: "Extra Ice", price: 20),
          Addon(name: "Honey Drizzle", price: 30),
          Addon(name: "Lemon Zest", price: 50),
        ]),
    Food(name:"Strawberry Milkshake" ,
        description: "A thick and creamy shake made with fresh strawberries, milk, and a scoop of ice cream for extra indulgence.",
        imagePath:"assets/images/Drinks/Strawberry_milkshake.png",
        price: 250,
        category: FoodCategory.Drinks,
        availableAddons: [
          Addon(name: "Extra Ice", price: 20),
          Addon(name: "Honey Drizzle", price: 30),
          Addon(name: "Lemon Zest", price: 30),
        ]),
    Food(name:"Mango Lassi" ,
        description: "A creamy, rich yogurt-based mango smoothie, blending sweet mangoes with a hint of cardamom.",
        imagePath:"assets/images/Drinks/Mango_lassi.png",
        price: 100,
        category: FoodCategory.Drinks,
        availableAddons: [
          Addon(name: "Extra Ice", price: 20),
          Addon(name: "Honey Drizzle", price: 30),
          Addon(name: "Lemon Zest", price: 30),
        ]),
    Food(name:"Lemon Mint Cooler" ,
        description: "A zesty fusion of fresh lemon juice, cooling mint, and sparkling soda for the ultimate thirst quencher.",
        imagePath:"assets/images/Drinks/Lemon_mint_cooler.jpg",
        price: 220,
        category: FoodCategory.Drinks,
        availableAddons: [
          Addon(name: "Extra Ice", price: 20),
          Addon(name: "Honey Drizzle", price: 30),
          Addon(name: "Lemon Zest", price: 50),
        ]),
    Food(name:"Iced Coffee" ,
        description: "Chilled, smooth coffee brewed to perfection, served over ice with a touch of milk or cream for a refreshing caffeine kick.",
        imagePath:"assets/images/Drinks/Iced_coffee.jpg",
        price: 150,
        category: FoodCategory.Drinks,
        availableAddons: [
          Addon(name: "Extra Ice", price: 20),
          Addon(name: "Honey Drizzle", price: 30),
          Addon(name: "Lemon Zest", price: 50),
        ]),
    Food(name:"Golden Sunset Citrus Cooler" ,
        description: "A radiant blend of orange, pineapple, and a splash of honey, capturing the warmth of a sunset in every sip.",
        imagePath:"assets/images/Drinks/Golden Sunset Citrus Cooler.png",
        price: 220,
        category: FoodCategory.Drinks,
        availableAddons: [
          Addon(name: "Extra Ice", price: 20),
          Addon(name: "Honey Drizzle", price: 30),
          Addon(name: "Lemon Zest", price: 50),
        ]),
  ];

  // user cart
  List<CartItem> _cart = [];

  //delivery address(Which user can change/update)
  String _deliveryAddress = 'Krishna Colony Street No.7';

  /*
  G E T T E R S
   */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;
  int get cartItemsCount => _cart.length;

/*
Operations
*/

  

// add to cart
void addToCart(Food food, List<Addon> selectedAddons){
  //see if there is a cart item already with the same food and selected addons
  CartItem? cartItem = _cart.firstWhereOrNull((item){
    //check if the food items are the same
    bool isSameFood =item.food == food;

    //check if the list of selected addons are the same
    bool isSameAddons =
        ListEquality().equals(item.selectAddons, selectedAddons);

    return isSameFood && isSameAddons;
  });
  // if item already exists, increase it's quantity
  if(cartItem != null){
    cartItem.quantity++;
  }
  //otherwise , add a new item to the cart
  else{
    _cart.add(
      CartItem(food: food, selectAddons: selectedAddons),
    );
  }
  notifyListeners();
} // end of add to cart

//remove from cart
void removeFromCart(CartItem cartItem){
  int cartIndex = _cart.indexOf(cartItem);

  if(cartIndex != -1){
    if(_cart[cartIndex].quantity>1){
      _cart[cartIndex].quantity--;
    }else{
      _cart.removeAt(cartIndex);
    }
  }
  notifyListeners();
}


//get total number of item in cart
int getTotalItemCount(){
  int totalItemCount =0;

  for(CartItem cartItem in _cart){
    totalItemCount += cartItem.quantity;
  }
  return totalItemCount;
}

// Get subtotal (sum of all item prices in the cart)
  double getSubtotal() {
    double subtotal = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      // Include add-ons price
      for (Addon addon in cartItem.selectAddons) {
        itemTotal += addon.price;
      }

      subtotal += itemTotal * cartItem.quantity;
    }
    return subtotal;
  }

// Get tax amount (5% tax)
  double getTax() {
    return getSubtotal() * 0.05; // 5% of subtotal
  }

// Get final total (Subtotal + Tax)
  double getTotalPrice() {
    return getSubtotal() + getTax();
  }


//clear cart
void clearCart(){
  _cart.clear();
  notifyListeners();
}

// update delivery address
  void updateDeliveryAddress(String newAddress) {
  _deliveryAddress = newAddress;
  notifyListeners();
  }

/*
H E L P E R S
 */


//generate   receipt

  String displayCartReceipt(){
    final receipt=StringBuffer();
    receipt.write("Here's your receipt.");
    receipt.writeln();
  //format the date to include up ot seconds only
    String formattedDate =
    DateFormat('yyyy-MM-dd HH:mm;ss').format(DateTime.now());

  receipt.writeln(formattedDate);
  receipt.writeln();
  receipt.writeln("-----------");
    receipt.writeln();


  for(final cartItem in cart) {
    receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} -${_formatPrice(cartItem.food.price)}");
    if(cartItem.selectAddons.isNotEmpty){
      receipt.writeln("  Add-ons: ${_formatAddons(cartItem.selectAddons)}");
    }
    receipt.writeln();
  }
    receipt.writeln("-----------");
    return receipt.toString();

  }
 // format double value into money
String _formatPrice(double price){
  return "(₹${price.toStringAsFixed(2)})";
}

//format list of addons in to a string summary
String _formatAddons(List<Addon> addons){
  return addons.map((addon) => "${addon.name} ${_formatPrice(addon.price)}")
      .join(",");
}
}