import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';
import 'delivery_progress_page.dart';
import 'home_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final  userCart = restaurant.cart;

      //Scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context). colorScheme.inversePrimary,
          actions: [
            //clear cart button
            IconButton(onPressed: () {
              showDialog(context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Are you sure you want to clear the cart?"),
                    actions: [
                      //cancel button
                      TextButton(onPressed: () =>Navigator.pop(context),
                          child: const Text("Cancel"),),
                      //yes button
                      TextButton(onPressed: ()  {
                        Navigator.pop(context);
                        restaurant.clearCart();
                        },
                        child: const Text("Yes"),),
                    ],
                  ));
            },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            //list of cart
            Expanded (
              child: Column(
                children: [
                  userCart.isEmpty ? const Expanded(child: Center(child: Text("Cart is Empty..",
                    style: TextStyle(fontSize: 30,
                    color: Colors.grey),
                  ),
                  ),
                  )
                      : Expanded(child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder: (context, index) {
                        //get individual cart item
                        final cartItem = userCart[index];

                        //return cart tile ui
                        return MyCartTile(cartItem: cartItem);
                      }
                  ))
                ],
              ),
            ),

            // button to pay
            MyButton(
              onTap: () {
                if (userCart.isEmpty) {
                  // Show popup (AlertDialog)
                  showDialog(
                    context: context,
                     barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Notice"),
                        content: const Text("Your cart is empty! Add some delicious items to proceed."),
                        actions: [],
                      );
                    },
                  );
                  // Close the dialog after 3 seconds and go to Home Page
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pop(context); // Close AlertDialog
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                          (route) => false, // Remove all previous routes
                    );
                  });
                } else {
                  // Show payment mode selection
                  _showPaymentDialog(context);
                }
              },
              text: "Go to checkout",
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      );
    });
  }
}
void _showPaymentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Theme(
      data: Theme.of(context).copyWith(
        dialogTheme: DialogThemeData(
          //backgroundColor: const Color.fromARGB(255, 233, 174, 91),
          backgroundColor: Colors.blue.shade300), // Change background color
      ),
      child: AlertDialog(
        title: const Text(
          "Select Payment Method",
          style: TextStyle(color:Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text(
                "Cash on Delivery",
                style: TextStyle(color: Colors.white), // Change text color
              ),
              leading: const Icon(Icons.money, color: Colors.black), // Change icon color
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DeliveryProgressPage(paymentMethod: "Cash on Delivery"),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                "Credit/Debit Card",
                style: TextStyle(color: Colors.white), // Change text color
              ),
              leading: const Icon(Icons.credit_card, color: Colors.black), // Change icon color
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}

