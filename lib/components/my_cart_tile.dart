import 'package:flutter/material.dart';
import 'package:grocery_app/components/my_quantity_selector.dart';
import 'package:grocery_app/models/cart_item.dart';
import 'package:grocery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: cartItem.food.imagePath.startsWith('http')
                      ? Image.network(
                          cartItem.food.imagePath,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            height: 100,
                            width: 100,
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image, size: 50),
                          ),
                        )
                      : Image.asset(
                          cartItem.food.imagePath,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                ),

                const SizedBox(width: 10),

                // name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // food name
                    Text(cartItem.food.name),

                    // food price
                    Text("${cartItem.food.price} DH",style: TextStyle(color: Theme.of(context).colorScheme.primary),),

                    const SizedBox(height: 10),

                    QuantitySelector(
                      quantity: cartItem.quantity,
                      food: cartItem.food,

                      onDecrement: () {
                        restaurant.removeFromCart(cartItem);
                      },

                      onIncrement: () {
                        restaurant.addToCart(
                          cartItem.food,
                          cartItem.selectedAddons,
                        );
                      },

                    )
                  ],
                ),


                // increment or decrement quantity
                
              ],
            ),

            // addons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10,bottom: 10,right: 10),
                children: cartItem.selectedAddons
                  .map((addon) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      label: Row(
                        children: [
                          // addon name
                          Text(addon.name),
                    
                          // addon price
                          Text('(${addon.price} DH)'),
                        ],
                      ), 
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary
                        )
                      ),
                      onSelected: (value){},
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 12,
                        ),
                      ),
                  )
                  )
                  .toList(),
              ),
            ),
          ],
        ), // Column
      ), // Container
    ); // Consumer
  }
}
