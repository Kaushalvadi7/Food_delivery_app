import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current time and add 25 minutes for estimated delivery
    DateTime estimatedTime = DateTime.now().add(const Duration(minutes: 25));

    // Format time in 24-hour format
    String formattedTime =
        "${estimatedTime.hour}:${estimatedTime.minute.toString().padLeft(2, '0')}";

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          const Text(
            "Thank you for your order!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          Text(
            "Estimated delivery time: $formattedTime",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),

          // Order Receipt & Address
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(25),
            child: Consumer<Restaurant>(
              builder: (context, restaurant, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Address: ${restaurant.deliveryAddress}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(restaurant.displayCartReceipt()),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Order Summary Section
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Consumer<Restaurant>(
              builder: (context, restaurant, child) => Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Order Summary",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const Divider(),
                      Text("Subtotal: ₹${restaurant.getSubtotal()}"),
                      Text("Tax (5%): ₹${restaurant.getTax()}"),
                      Text(
                        "Total: ₹${restaurant.getTotalPrice()}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
