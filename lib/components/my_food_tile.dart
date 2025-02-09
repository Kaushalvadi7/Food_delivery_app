import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

 class FoodTile extends StatelessWidget {

  final Food food;
  final void Function()? onTap;

  const FoodTile({super.key,
  required this.food,
  required this.onTap,  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  //food image
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(food.imagePath,height: 120,width: 120,fit: BoxFit.cover)),

                  const SizedBox(width: 15,),
                  //text food details
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface ),),
                     //price
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '₹${food.price}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                     const SizedBox(height: 10,),

                     //Description
                      Text(
                        food.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        maxLines: 2, // Prevents long text overflow
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                  ),
                  ),
                ],
              ),
            ),
        ),
          //divider line
          Divider(
           color: Theme.of(context).colorScheme.tertiary,
            endIndent: 25,
            indent: 25,
         )
      ],
    );
  }
}


//
// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/models/food.dart';
//
// class FoodTile extends StatelessWidget {
//
//   final Food food;
//   final void Function()? onTap;
//
//   const FoodTile({super.key,
//     required this.food,
//     required this.onTap,  });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Row(
//               children: [
//                 //text food details
//                 Expanded(child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(food.name),
//                     Text('₹' + food.price.toString(),
//                       style: TextStyle(color: Theme.of(context).colorScheme.primary),),
//                     const SizedBox(height: 10,),
//                     Text(food.description, style: TextStyle( color: Theme.of(context).colorScheme.inversePrimary),),
//                   ],
//                 ),
//                 ),
//                 const SizedBox(width: 15,),
//                 //food image
//
//                 ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(food.imagePath,height: 120,width: 200,)),
//               ],
//             ),
//           ),
//         ),
//         //divider line
//         Divider(
//           color: Theme.of(context).colorScheme.tertiary,
//           endIndent: 25,
//           indent: 25,
//         )
//       ],
//     );
//   }
// }
//
