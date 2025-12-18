import 'package:flutter/material.dart';
import 'package:grocery_app/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildCategoryTabs() {
  return FoodCategory.values.map((category) {
    String label;

    switch (category) {
      case FoodCategory.marche:
        label = "Marché";
        break;
      case FoodCategory.latiers:
        label = "Latiers";
        break;
      case FoodCategory.produit:
        label = "Produit";
        break;
      case FoodCategory.snacking:
        label = "Snacking";
        break;
      case FoodCategory.drinks:
        label = "Drinks";
        break;
    }

    return Tab(text: label);
  }).toList();
}



  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
      ), // TabBar
    ); // Container
  }
}
