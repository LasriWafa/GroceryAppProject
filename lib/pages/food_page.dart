import 'package:flutter/material.dart';
import 'package:grocery_app/components/my_button.dart';
import 'package:grocery_app/models/food.dart';
import 'package:grocery_app/models/restaurant.dart';
import 'package:provider/provider.dart';
class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon,bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,

  }){
    for(Addon addon in food.availableAddons){
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addToCart(Food food, Map<Addon, bool> selectedAddons){
    //close the current food page to go back to menu
    Navigator.pop(context);

    // format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    // add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
        return Stack(children: [
          Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // food image
              widget.food.imagePath.startsWith('http')
                  ? Image.network(
                      widget.food.imagePath,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: const Center(child: Icon(Icons.broken_image, size: 100)),
                      ),
                    )
                  : Image.asset(widget.food.imagePath),
          
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // food name
                    Text(
                      widget.food.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ), // TextStyle
                    ), // Text
          
                     // food price
                    Text(
                      '${widget.food.price} DH' ,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ), // TextStyle
                    ),
                    
                     const SizedBox(height: 10,),
          
                    // food description
                    Text(widget.food.description ),
          
                    const SizedBox(height: 10,),
          
                    Divider(color: Theme.of(context).colorScheme.secondary,),
          
                    const SizedBox(height: 10,),
                    // addons
                     Text(
                     "Add-ons",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary, 
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ), // TextStyle
                    ),
                      const SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,),
                      borderRadius: BorderRadius.circular(8), // Border.all
                    ), // BoxDecoration
          
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: widget.food.availableAddons.length,
                        itemBuilder: (context, index) {
                          // get individual addon
                          Addon addon = widget.food.availableAddons[index];
                                    
                          // return check box UI
                          return CheckboxListTile(
                            title: Text(addon.name),
                            subtitle: Text('${addon.price} DH',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                            value: widget.selectedAddons[addon],
                            onChanged: (bool? value) {
                              setState(() {
                                widget.selectedAddons[addon] = value!;
                              });
                            },
                          ); // CheckboxListTile
                        },
                      ),
                    ),
                  ],
                ),
              ),
              MyButton(
                text: "Add to cart", 
                onTap: ()=> addToCart(widget.food, widget.selectedAddons),
              ),

              const SizedBox(height: 25,)


            ],
          ),
        ),
      ),
      SafeArea(
        child: Opacity(
          opacity: 0.6,
          child: Container(
            margin: EdgeInsets.only(left: 25,top: 10),
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,shape: BoxShape.circle),
            child: IconButton(
              onPressed: () => Navigator.pop(context), 
              icon: const Icon(Icons.arrow_back_ios_rounded)
              ),
          ),
        ),
      )
      ],  
    );
  }
}
