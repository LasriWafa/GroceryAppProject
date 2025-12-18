import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_item.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'food.dart';
import 'package:grocery_app/services/food/food_service.dart';

class Restaurant extends ChangeNotifier{
  final FoodService _foodService = FoodService();
  final List<Food> _menu = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Restaurant() {
    _fetchMenu();
  }

  Future<void> _fetchMenu() async {
    _isLoading = true;
    notifyListeners();

    try {
      _menu.clear();
      for (var category in FoodCategory.values) {
        List<Food> foods = await _foodService.fetchFoods(category);
        _menu.addAll(foods);
      }
    } catch (e) {
      print("Error fetching menu: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  
  //user cart
  final Map<String, List<CartItem>> _userCarts = {};


  // delivery address
  String _deliveryAddress = 'Av.Atlas El kebir Sale';

    
    /* 

      GETTERS

    */
    List<Food> get menu => _menu;
    List<CartItem> get cart {
      final uid = _userId;
      if (uid == null) return [];
      return _userCarts.putIfAbsent(uid, () => []);
    }

    String get deliveryAddress => _deliveryAddress;
    String? get _userId => FirebaseAuth.instance.currentUser?.uid;

    /* 

      OPERATIONS

    */
    //add to cart
    
    // add to cart
    void addToCart(Food food, List<Addon> selectedAddons) {
      // see if there is a cart item already with the same food and selected addons
      CartItem? cartItem = cart.firstWhereOrNull((item) {
        // check if the food items are the same
        bool isSameFood = item.food == food;

        // check if the list of selected addons are the same
        bool isSameAddons =
            ListEquality().equals(item.selectedAddons, selectedAddons);

        return isSameFood && isSameAddons;
      });

      // if item already exists, increase it's quantity
      if (cartItem != null) {
        cartItem.quantity++;
      }

      // otherwise, add a new cart item to the cart
      else {
        cart.add(CartItem(food: food, selectedAddons: selectedAddons));
      }
      notifyListeners();
    }
    // remove from cart
    void removeFromCart(CartItem cartItem) {
      int cartIndex = cart.indexOf(cartItem);

      if (cartIndex != -1) {
        if (cart[cartIndex].quantity > 1) {
          cart[cartIndex].quantity--;
        } else {
          cart.removeAt(cartIndex);
        }
      }
      notifyListeners();
    }

    // get total price of cart
    double getTotalPrice() {
      double total = 0.0;

      for (CartItem cartItem in cart) {
        double itemTotal = cartItem.food.price;

        for (Addon addon in cartItem.selectedAddons) {
          itemTotal += addon.price;
        }

        total += itemTotal * cartItem.quantity;
      }

      return total;
    }

    // get total number of items in cart
    int getTotalItemCount() { 
      int totalItemCount = 0;

      for (CartItem cartItem in cart) {
        totalItemCount += cartItem.quantity;
      }

      return totalItemCount;
    }

    //clear cart
    void clearcArt() {
      final uid = _userId;
      if (uid == null) return;
      _userCarts[uid]?.clear();
      notifyListeners();
    }


    // update delivery address
    void updateDeliveryAddress(String newAddress) {
      _deliveryAddress = newAddress;
      notifyListeners();
    }

    


    /* 

      HELPERS

    */

    // generate a receipt
    String displayCartReceipt() {
      final receipt = StringBuffer();
      receipt.writeln("Here's your receipt.");
      receipt.writeln();
 
      // format the date to include up to seconds only
      String formattedDate =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

      receipt.writeln(formattedDate);
      receipt.writeln();
      receipt.writeln("-----------");

      for (final cartItem in cart) {
        receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} – ${_formatPrice(cartItem.food.price)}",
        );

        if (cartItem.selectedAddons.isNotEmpty) {
          receipt.writeln(
            "   Add-ons: ${_formatAddons(cartItem.selectedAddons)}",
          );
        }

        receipt.writeln();
      }
      receipt.writeln("-----------");
      receipt.writeln();
      receipt.writeln("Total Items: ${getTotalItemCount()}");
      receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
      receipt.writeln();
      receipt.writeln("Delivering to: $deliveryAddress");

      return receipt.toString();
    }

    // format double value into money
    String _formatPrice(double price) {
      return "\$${price.toStringAsFixed(2)}";
    }

    // format list of addons into a string summary
    String _formatAddons(List<Addon> addons) {
      return addons
          .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
          .join(", ");
    }

}
