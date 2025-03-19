import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';
import '../services/notification_service/noti_service.dart';
import 'delivery_progress_page.dart';
import 'home_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final  userCart = restaurant.cart;

      // calculate total price dynamically
      double totalPrice = userCart.fold(0, (sum, cartItem) => sum + cartItem.totalPrice);
      //Scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 2,
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
          leading : IconButton(
              onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>HomePage()));
          },
              icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).colorScheme.inversePrimary,)),
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
                      : Expanded(child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          //get individual cart item
                          final cartItem = userCart[index];

                          //return cart tile ui
                          return MyCartTile(cartItem: cartItem);
                        }
                                          ),
                      ))
                ],
              ),
            ),

            // Total Price
            totalPrice > 0
                ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Total Price : Rs ${totalPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            )
                : SizedBox(),

            // button to pay
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.92,
              height: 62, // Fixed height
              child: ElevatedButton(
                onPressed: () {
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
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context); // Close AlertDialog
                      Navigator.pushAndRemoveUntil(
                        // ignore: use_build_context_synchronously
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFA825),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Go to checkout",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 25),
                ),
              ),
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
    builder: (context) =>
        Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: DialogThemeData(
              //backgroundColor: const Color.fromARGB(255, 233, 174, 91),
                backgroundColor: Theme.of(context).colorScheme.primary), // Change background color
          ),
          child: AlertDialog(
            title: const Text(
              "Select Payment Method",
              style: TextStyle(color: Colors.white),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text(
                    "Cash on Delivery",
                    style: TextStyle(color: Colors.white), // Change text color
                  ),
                  leading: const Icon(Icons.money, color: Colors.black),
                  // Change icon color
                  onTap: () {
                    Navigator.pop(context); // Close dialog
                    showLottieAnimation(context, "Cash on Delivery");
                  },
                ),
                ListTile(
                  title: const Text(
                    "Credit/Debit Card",
                    style: TextStyle(color: Colors.white), // Change text color
                  ),
                  leading: const Icon(Icons.credit_card, color: Colors.black),
                  // Change icon color
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
  void showLottieAnimation(BuildContext context, String paymentMethod) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/animation/food_delivery_animation.json',
              width: 400,
              height: 400,
              repeat: false,
              animate: true,
              onLoaded: (composition) {

                Future.delayed(composition.duration, () {
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeliveryProgressPage(paymentMethod: paymentMethod),
                    ),
                  );
                  NotiService().showNotification(
                      title: "Zaikit",
                      body: "Your Order has been Placed!");
                });
              },
            ),
            const SizedBox(height: 10),
            const Text(
              "Processing your payment...",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }






