import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/food.dart';

class FirestoreSeeder {
  final CollectionReference foods = FirebaseFirestore.instance.collection('foods');

  Future<void> seedDatabase() async {
    // Clear existing data to avoid duplicates/stale paths
    print("Clearing existing database...");
    QuerySnapshot snapshot = await foods.get();
    for (DocumentSnapshot doc in snapshot.docs) {
      await doc.reference.delete();
    }
    
    print("Seeding database with CORRECT file paths...");
    
    List<Food> menu = [
      // -----------------------
      // SNACKING (Biscuits/Chips)
      // -----------------------
      Food(
        name: "Lays",
        description: "Classic salted chips",
        imagePath: "lib/images/biscuit/lays.png",
        price: 2.50,
        category: FoodCategory.snacking,
        availableAddons: [],
      ),
      Food(
        name: "Oreo",
        description: "Chocolate sandwich cookies",
        imagePath: "lib/images/biscuit/oreo.png",
        price: 3.00,
        category: FoodCategory.snacking,
        availableAddons: [],
      ),
      Food(
        name: "Pringles",
        description: "Sour cream and onion chips",
        imagePath: "lib/images/biscuit/pringles.png",
        price: 4.00,
        category: FoodCategory.snacking,
        availableAddons: [],
      ),
      Food(
        name: "KitKat",
        description: "Chocolate covered wafer",
        imagePath: "lib/images/biscuit/kitkat.png",
        price: 1.50,
        category: FoodCategory.snacking,
        availableAddons: [],
      ),
       Food(
        name: "Kinder",
        description: "Milk chocolate bar",
        imagePath: "lib/images/biscuit/kinder.png",
        price: 1.80,
        category: FoodCategory.snacking,
        availableAddons: [],
      ),
      Food(
        name: "Be Cookies",
        description: "Crunchy cookies",
        imagePath: "lib/images/biscuit/be.png",
        price: 2.00,
        category: FoodCategory.snacking,
        availableAddons: [],
      ),

      // -----------------------
      // DRINKS
      // -----------------------
      Food(
        name: "Coca Cola",
        description: "Refreshing cola",
        imagePath: "lib/images/drinks/cocacola.png",
        price: 1.50,
        category: FoodCategory.drinks,
        availableAddons: [],
      ),
      Food(
        name: "Pepsi",
        description: "Cola drink",
        imagePath: "lib/images/drinks/Pepsi.png",
        price: 1.50,
        category: FoodCategory.drinks,
        availableAddons: [],
      ),
      Food(
        name: "Hawaii",
        description: "Tropical soda",
        imagePath: "lib/images/drinks/hawai.png",
        price: 1.50,
        category: FoodCategory.drinks,
        availableAddons: [],
      ),
       Food(
        name: "Poms",
        description: "Apple soda",
        imagePath: "lib/images/drinks/poms.png",
        price: 1.30,
        category: FoodCategory.drinks,
        availableAddons: [],
      ),
       Food(
        name: "Mogu Mogu",
        description: "Juice with nata de coco",
        imagePath: "lib/images/drinks/Mogumogu.png",
        price: 2.50,
        category: FoodCategory.drinks,
        availableAddons: [],
      ),
       Food(
        name: "Sidi Ali",
        description: "Mineral water",
        imagePath: "lib/images/drinks/sidiali.png",
        price: 1.00,
        category: FoodCategory.drinks,
        availableAddons: [],
      ),

      // -----------------------
      // DAIRY (Latiers)
      // -----------------------
      Food(
        name: "Danone",
        description: "Fresh yogurt",
        imagePath: "lib/images/latiers/DANON.png",
        price: 0.80,
        category: FoodCategory.latiers,
        availableAddons: [],
      ),
      Food(
        name: "Jawda",
        description: "Fresh milk",
        imagePath: "lib/images/latiers/JAWDA.png",
        price: 1.20,
        category: FoodCategory.latiers,
        availableAddons: [],
      ),
      Food(
        name: "La Vache Qui Rit",
        description: "Spread cheese",
        imagePath: "lib/images/latiers/LAVACHE.png",
        price: 3.50,
        category: FoodCategory.latiers,
        availableAddons: [],
      ),
      Food(
        name: "Kiri",
        description: "Cream cheese portions",
        imagePath: "lib/images/latiers/KIRI.png",
        price: 4.00,
        category: FoodCategory.latiers,
        availableAddons: [],
      ),

      // -----------------------
      // MARKET (Produce)
      // -----------------------
      Food(
        name: "Tomato",
        description: "Fresh tomatoes (Maticha)",
        imagePath: "lib/images/marche/MATICHA.png",
        price: 1.00,
        category: FoodCategory.marche,
        availableAddons: [],
      ),
      Food(
        name: "Potato",
        description: "Potatoes (Btata)",
        imagePath: "lib/images/marche/BTATA.png",
        price: 1.20,
        category: FoodCategory.marche,
        availableAddons: [],
      ),
      Food(
        name: "Onion",
        description: "Red onions (Besla)",
        imagePath: "lib/images/marche/BESLA.png",
        price: 0.80,
        category: FoodCategory.marche,
        availableAddons: [],
      ),
      Food(
        name: "Apple",
        description: "Red apples (Tefa7)",
        imagePath: "lib/images/marche/TEFA7.png",
        price: 2.00,
        category: FoodCategory.marche,
        availableAddons: [],
      ),
      Food(
        name: "Banana",
        description: "Yellow bananas",
        imagePath: "lib/images/marche/BANANA.png",
        price: 1.80,
        category: FoodCategory.marche,
        availableAddons: [],
      ),
       Food(
        name: "Orange",
        description: "Juicy oranges",
        imagePath: "lib/images/marche/LIMONA.png",
        price: 1.50,
        category: FoodCategory.marche,
        availableAddons: [],
      ),

      // -----------------------
      // CLEANING (Produits)
      // -----------------------
      Food(
        name: "Tide",
        description: "Laundry detergent",
        imagePath: "lib/images/produit/TIDE.png",
        price: 5.00,
        category: FoodCategory.produit,
        availableAddons: [],
      ),
       Food(
        name: "Ariel",
        description: "Detergent powder",
        imagePath: "lib/images/produit/ARIEL.png",
        price: 6.00,
        category: FoodCategory.produit,
        availableAddons: [],
      ),
       Food(
        name: "Fairy",
        description: "Dishwashing liquid",
        imagePath: "lib/images/produit/FAIRY.png",
        price: 3.00,
        category: FoodCategory.produit,
        availableAddons: [],
      ),
       Food(
        name: "Omo",
        description: "Laundry detergent",
        imagePath: "lib/images/produit/OMO.png",
        price: 4.50,
        category: FoodCategory.produit,
        availableAddons: [],
      ),
    ];

    // Upload to Firestore
    for (Food food in menu) {
      try {
        await foods.add(food.toMap());
        print("Added ${food.name} to Firestore");
      } catch (e) {
        print("Error adding ${food.name}: $e");
      }
    }
    print("Seed complete!");
  }
}
