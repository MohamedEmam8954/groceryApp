import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/core/services/firebase_services.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/core/utils/show_toast.dart';
import 'package:grocery/features/profile/data/repo/orderRepo/order_repo.dart';
import 'package:uuid/uuid.dart';

class OrderRepoImp implements OrderRepo {
  @override
  Future<void> makeOrder(
      {required String productId,
      required String price,
      required String totalPrice,
      required String quantity,
      required String imgUrl,
      required String title}) async {
    User user = FirebaseAuth.instance.currentUser!;
    String uid = user.uid;
    String displayName = user.displayName!;
    String uuid = const Uuid().v4();
    try {
      await getIt.get<FirebaseServices>().userOrder().doc(uuid).set({
        'orderId': uuid,
        "productId": productId,
        "price": price,
        "totalPrice": totalPrice,
        "quantity": quantity,
        "imgUrl": imgUrl,
        "userName": displayName,
        "orderDate": Timestamp.now(),
        "userId": uid,
        "title": title,
      });
    } catch (e) {
      log("this error from userOrder check it ");
      showToast(msg: e.toString());
    }
  }

  @override
  Future<List<dynamic>> getOrders({required String uid}) async {
    var data = await getIt.get<FirebaseServices>().fetchUserOrders(uid: uid);
    List<dynamic> orderList = data.docs;
    return orderList;
  }
}
