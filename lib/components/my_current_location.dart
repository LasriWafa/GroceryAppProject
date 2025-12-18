import 'package:flutter/material.dart';
import 'package:grocery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context){
  final textController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Your location"),
      content: TextField(
        controller: textController, // <-- IMPORTANT FIX
        decoration: const InputDecoration(hintText: "Enter address.."),
      ),
      actions: [
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),

        MaterialButton(
          onPressed: () {
            // update delivery address
            String newAddress = textController.text.trim();
            context.read<Restaurant>().updateDeliveryAddress(newAddress);

            Navigator.pop(context);
            textController.clear();
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
          Text("Deliver now",style: TextStyle(color: Theme.of(context).colorScheme.primary)),
      
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                // address
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // drop down menu
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ), // Row
        ],
      ),
    ); // Column
  }
}
