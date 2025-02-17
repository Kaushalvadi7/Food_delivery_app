import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../pages/home_page.dart';
import 'my_button.dart';

class MyReceipt extends StatelessWidget {
  final String paymentMethod;
  final String receipt;

  const MyReceipt({
    super.key,
    required this.paymentMethod,
    required this.receipt,
  });


  @override
  Widget build(BuildContext context) {
    // Get current time and add 25 minutes for estimated delivery
    DateTime estimatedTime = DateTime.now().add(const Duration(minutes: 25));

    // Format time in 24-hour format
    String formattedTime =
        "${estimatedTime.hour}:${estimatedTime.minute.toString().padLeft(2, '0')}";

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 25),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Thank you for your order!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),

              Text(
                "Estimated delivery time: $formattedTime",
                style: const TextStyle(fontSize: 16 ),
              ),
              const SizedBox(height: 20),

              // Order Receipt & Address
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Consumer<Restaurant>(
                      builder: (context, restaurant, child) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(restaurant.displayCartReceipt()),

              // Order Summary Section

              Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total item: ₹${restaurant.getTotalItemCount()}"),
                          Text("Subtotal: ₹${restaurant.getSubtotal()}"),
                          Text("Tax (5%): ₹${restaurant.getTax().toStringAsFixed(2)}"),
                          Text(
                            "Total: ₹${restaurant.getTotalPrice()}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Delivery Address: ${restaurant.deliveryAddress}",
                          ),
                          // Payment Method inside the container
                          Text(
                            "Payment Method: ${paymentMethod.isNotEmpty ? paymentMethod : "Not Provided"}",
                          ),



                          const SizedBox(height: 40),

                          // Close Button
                          MyButton(
                            onTap: () {
                              // Clear the cart before navigating to HomePage
                              Provider.of<Restaurant>(context, listen: false).clearCart();

                              // Navigate to HomePage and remove previous pages from stack
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const HomePage()),
                                    (route) => false,
                              );
                            },
                            text: "Close",
                          ),
                        ],
                      ),

                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
