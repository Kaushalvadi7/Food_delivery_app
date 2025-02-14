import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
   MyCurrentLocation({super.key});

   final textController = TextEditingController();

  void openLocationSearchBox(BuildContext context){
    showDialog(context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: const Text("Your Location"),
          content: TextField(
          controller : textController,
            decoration: const InputDecoration(hintText: "Enter address..."),
          ),
          actions: [
            //cancel button
            MaterialButton(
              onPressed: () {
        Navigator.pop(context);
            textController.clear();
        },// Close the dialog
              child: const Text("Cancel"),
            ),

            // save button
            MaterialButton(
              onPressed: () {
                // Get the entered text
                String newAddress = textController.text.trim();

                if (newAddress.isEmpty) {
                  if (kIsWeb) {
                    // Show Snackbar for Web
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter an address"),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  } else {
                    // Show Toast for Android/iOS
                    Fluttertoast.showToast(
                      msg: "Please enter an address",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      textColor: Colors.white,
                    );
                  }
                } else {
                  // Update the delivery address
                  context.read<Restaurant>().updateDeliveryAddress(newAddress);

                  // Close the dialog
                  Navigator.pop(context);

                  // Clear the text field
                  textController.clear();
                }
              },
              child: const Text("Save"),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver now",
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
        ),
          ),
              GestureDetector(
                onTap: () => openLocationSearchBox(context),
                child: Row(
                children: [
                  Icon(Icons.location_pin, size: 18,),
                  //address
                 Consumer<Restaurant>(builder: (context , restaurant , child) => Text(
                   restaurant.deliveryAddress,
                     style: TextStyle(
                       color: Theme.of(context).colorScheme.inversePrimary,
                       fontWeight: FontWeight.bold,
                     ),)),

                  // drop down menu
                  Icon(Icons.keyboard_arrow_down_rounded),

                ],
                ),
              ),
        ],
      ),
    );
  }
}
