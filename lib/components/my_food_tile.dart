import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';
import 'addon_selection_bottom_sheet.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final VoidCallback onTap; // Opens food details page

  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap, // Opens the food details page
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  // Food Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(food.imagePath, height: 100, width: 100, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 15),

                  // Food Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Food Name
                        Text(
                          food.name,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),

                        // Food Price
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '₹${food.price}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 5),

                        // Short Description
                        Text(
                          food.description,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // Add to Cart Button
                  ElevatedButton(
                    onPressed: () {
                      if (food.availableAddons.isNotEmpty) {
                        _showAddonBottomSheet(context, food);
                      } else {
                        Provider.of<Restaurant>(context, listen: false).addToCart(food, []);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    child: const Text("Add to Cart", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),

          // Improved Divider for Light Mode
          Divider(
            color: Colors.grey.shade400, // Adjusted for better visibility
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
        ],
      ),
    );
  }

  // Show bottom sheet for selecting add-ons
  void _showAddonBottomSheet(BuildContext context, Food food) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Makes the bottom sheet more fluid
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      builder: (context) => AddonSelectionBottomSheet(food: food),
    );
  }
}


