import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

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
                  // text food details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(food.name),
                        Text(food.price.toString()+'\ DH', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                        const SizedBox(height: 10,),
                        Text(food.description,style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                      ],
                    ), // Column
                  ), // Expanded
                  const SizedBox(width: 15,),
                  // food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: food.imagePath.startsWith('http') 
                        ? Image.network(
                            food.imagePath,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 120,
                              height: 120,
                              color: Colors.grey[300],
                              child: const Icon(Icons.fastfood, size: 50),
                            ),
                          )
                        : Image.asset(
                            food.imagePath,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                  ),
                ],
              ), // Row
            ), // Padding
          ),
          Divider(
            color: Theme.of(context).colorScheme.tertiary,
            endIndent: 25,
            indent: 25,
          )
        ],
      ); // Column
    }

}