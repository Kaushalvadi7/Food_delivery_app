import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';
class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key,
    required this.tabController,
  });
  List<Tab> _buildCategoryTabs(){
    return FoodCategory.values.map((category){
      return Tab(
        text: category.toString().split(".").last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
          labelColor:Theme.of(context).colorScheme.primary, // Selected tab text color
          unselectedLabelColor: Theme.of(context).colorScheme.inversePrimary, // Unselected tab text color
          indicatorColor: Colors.orange,
          controller: tabController,
          tabs: _buildCategoryTabs(),
      );
  }
}
