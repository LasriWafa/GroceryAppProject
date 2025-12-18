import 'package:flutter/material.dart';
import 'package:grocery_app/components/my_receipt.dart';
import 'package:grocery_app/models/restaurant.dart';
import 'package:grocery_app/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  // get access to db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    // if we get to this page, submit order to firestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ), // AppBar
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
      children: const [
        Expanded(
          child: MyReceipt(),
        ),
      ],
    ),
 // Column
    ); // Scaffold
  }

// Custom Bottom Nav Bar – Message / Call delivery driver
Widget _buildBottomNavBar(BuildContext context) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ), // BorderRadius.only
    ),
    padding: const EdgeInsets.all(25), // BoxDecoration
    child: Row(
      children: [
        // profile pic of driver
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: BoxShape.circle,
          ), // BoxDecoration
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ), // Container
        const SizedBox(width: 10,),
       // driver details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mitch Koko",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ), // Text

            Text(
              "Driver",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ), // Text
          ],
        ),
        const Spacer(),
        Row(
          children: [
            // message button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ), // BoxDecoration
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message),
                color: Theme.of(context).colorScheme.primary,
              ), // IconButton
            ), // Container

            SizedBox(width: 10),

            // call button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ), // BoxDecoration
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call),
                color: Colors.green,
              ), // IconButton
            ), // Container
          ],
        ), // Row


      ],
    ), // Row
  ); // Container
}
}
