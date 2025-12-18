import 'package:flutter/material.dart';
import 'package:grocery_app/components/my_button.dart';
import 'package:grocery_app/components/my_cart_tile.dart';
import 'package:grocery_app/models/restaurant.dart';
import 'package:grocery_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {

        // cart
        final userCart = restaurant.cart;

        // scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: Center(child: const Text("Cart")),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //clear all cart
              IconButton(
                onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: Text("Are you sure you want to clear the cart?"),
                      actions: [
                        //cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context), 
                          child: Text("Cancel")),
                        // yes button
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                            restaurant.clearcArt();
                          }, 
                          child: Text("Yes"))
                      ],
                    ),
                  );
                }, 
                icon: const Icon(Icons.delete))
            ],
          ), // AppBar
          body: Column(
          children: [
            // list of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(child: Text("Cart is empty")),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              final cartItem = userCart[index];
                              return MyCartTile(cartItem: cartItem);
                            },
                          ),
                        ),
                ],
              ),
            ),

            // button to pay (later)
            MyButton(
              text: "Go to checkout", 
              onTap: ()=> Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(),
              ))
            ),
            const SizedBox(height: 25,)
          ],
        ),
        );
      },
    ); // Consumer
  }
}
