import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    //Get current time and add 25 minutes
    DateTime estimatedTime =DateTime.now().add(const Duration(minutes: 25));

    //format time in 24-hour format
    String formattedTime = "${estimatedTime.hour}:${estimatedTime.minute.toString().padLeft(2,'0')}";
    return Padding(padding: const EdgeInsets.only(left: 25, right: 25,bottom: 25, top: 50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         const Text("Thank you for your order!"),
        const SizedBox(height: 25,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(8)
          ),
          padding: const EdgeInsets.all(25),
          child: Consumer<Restaurant>(
            builder:(context, restaurant, child) => Text(restaurant.displayCartReceipt()),
          ),
        ),
            const SizedBox(height: 25),
            Text("Estimated delivery time is: $formattedTime"),
      ],
    ),
    );
  }
}
