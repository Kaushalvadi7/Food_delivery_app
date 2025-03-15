import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_quantity_selector.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../models/cart_item.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this .cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context ,restaurant,child) => Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                    child: Image.asset(cartItem.food.imagePath,
                      height: 100,
                        width: 100,
                    ),),

                const SizedBox(width: 10,),
                //name and price
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // food name
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,                       child: Text(cartItem.food.name,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,

                          ),
                        ),

                        const SizedBox(height: 5,),

                        //food price
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                              '₹${cartItem.food.price}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),

                        // Text('₹${cartItem.food.price}',style: TextStyle(fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),
                const Spacer(),
                // increment or decrement quantity
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: QuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onDecrement: () {
                          restaurant.removeFromCart(cartItem);
                        },
                        onIncrement:(){
                          restaurant.addToCart(cartItem.food, cartItem.selectAddons);
                        }),
                  )
              ],
            ),
          ),

          //addons
          SizedBox(
            height : cartItem.selectAddons.isEmpty? 0 : 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding:  const EdgeInsets.only(left: 10,bottom: 10,right: 10),
              children: cartItem.selectAddons
                  .map(
                    (addon) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        label: Row(
                                      children: [
                                        //addon name
                                        Text(addon.name,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
                                        SizedBox(width: 5,),
                                        // addon price
                                        Text('₹${addon.price.toString()}',
                                        style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold, fontSize: 15),),
                                      ],
                                    ),
                                      shape: StadiumBorder(
                                        side: BorderSide(
                                      color: Theme.of(context).colorScheme.primary
                                        )
                                      ),
                                      onSelected: (value) {},
                                      backgroundColor: Theme.of(context).colorScheme.secondary,
                                      labelStyle: TextStyle(
                                        color: Theme.of(context).colorScheme.inversePrimary,

                                        fontSize: 12,
                                      ),
                                    ),
                    ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    ));
  }
}
