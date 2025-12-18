import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/food.dart';

class FoodService {
  final CollectionReference _foodsCollection = FirebaseFirestore.instance.collection('foods');

  Future<List<Food>> fetchFoods(FoodCategory category) async {
    try {
      // Query Firestore for foods matching the category
      QuerySnapshot snapshot = await _foodsCollection
          .where('category', isEqualTo: category.name)
          .get();

      // Convert documents to Food objects
      return snapshot.docs.map((doc) {
        return Food.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error fetching foods from Firestore: $e');
      return []; 
    }
  }
}
