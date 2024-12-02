import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static const String userCollection = "users";
  static const String productCollection = "products";
  static const String orders = "orders";

  DocumentReference? getUserDocument() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    String uid = user.uid;
    return FirebaseFirestore.instance.collection(userCollection).doc(uid);
  }

  Stream<QuerySnapshot> fetchProductsData() {
    return FirebaseFirestore.instance.collection(productCollection).snapshots();
  }

  CollectionReference userOrder() {
    return FirebaseFirestore.instance.collection(orders);
  }

  Future<QuerySnapshot> fetchUserOrders({required String uid}) async {
    return await FirebaseFirestore.instance
        .collection(orders)
        .where("userId", isEqualTo: uid)
        .orderBy("orderDate", descending: false)
        .get();
  }
}
