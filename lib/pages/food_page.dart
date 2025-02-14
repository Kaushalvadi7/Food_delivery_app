import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons ={};

   FoodPage({super.key,
     required this.food,}){
     //initialize selected addons to be false
     for(Addon addon in food.availableAddons){
       selectedAddons[addon] =false;
     }
   }
  
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method to add to cart
  void addToCart(Food food, Map<Addon,bool> selectedAddon ){
    //close the current food page to go back to menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentlySelectedAddons =[];
    for(Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }
    // add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //scaffold ui
    Scaffold (
    body: SingleChildScrollView (
    child: Column(
    children: [
    //food image
    Image.asset(widget.food.imagePath),

    //food name
    Padding(
    padding: const EdgeInsets.all(25.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(widget.food.name,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),

    // food price
      Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '₹${widget.food.price}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          ),

    const SizedBox(height: 10,),
    // food description
    Text(widget.food.description),

    const SizedBox(height: 10,),
    Divider(
    color: Theme.of(context).colorScheme.secondary,
    ),

    const SizedBox(height: 10,),
    //addons
    Text("Add-ons", style: TextStyle(
    color: Theme.of(context).colorScheme.inversePrimary,
    fontSize: 16,
    fontWeight: FontWeight.bold,),
    ),

    const SizedBox(height: 10,),
    Container(
    decoration: BoxDecoration(
    border: Border.all(color: Theme.of(context).colorScheme.secondary),
    borderRadius: BorderRadius.circular(8)),
    child: ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: widget.food.availableAddons.length,
    itemBuilder : (context, index){
    //get individual addon
    Addon addon  = widget.food.availableAddons[index];
    //return checkbox ui
    return CheckboxListTile(
      title: Text(addon.name),
      subtitle: Padding(
        padding: const EdgeInsets.only(right: 300),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color:
            Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '₹${addon.price}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      value: widget.selectedAddons[addon],
      onChanged: (bool? value) {
        setState(() {
          widget.selectedAddons[addon] = value!;
        });
      },
    );
    }),
    ),
    ],
    ),
    ),
    //button -> add to cart
    MyButton(text: "Add to Cart",
        onTap: () => addToCart(widget.food, widget.selectedAddons)),
    const SizedBox(height: 25,),
    ],
    ),
    ),
    ),

        //back button
        SafeArea (
          child: Opacity (
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),

                decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,),
              child: IconButton(
                   icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop((context)),),
            ),
          ),
        )
      ],
    );
  }
}
