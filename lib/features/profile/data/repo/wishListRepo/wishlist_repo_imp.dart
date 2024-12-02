import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/core/services/firebase_services.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/features/profile/data/repo/wishListRepo/wishlist_repo.dart';
import 'package:uuid/uuid.dart';

class WishlistRepoImp implements WishlistRepo {
  @override
  addProductToWishList(String productid) async {
    String uuid = const Uuid().v4();
    await getIt.get<FirebaseServices>().getUserDocument()!.update({
      "wishList": FieldValue.arrayUnion([
        {
          "productId": productid,
          "uuid": uuid,
        }
      ]),
    });
    await Fluttertoast.showToast(
      msg: "item has been added to  your wishlist",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
    );
  }

  @override
  removeProductFromWishList(
      {required String productId, required String uid}) async {
    await getIt.get<FirebaseServices>().getUserDocument()!.update({
      "wishList": FieldValue.arrayRemove([
        {
          "productId": productId,
          "uuid": uid,
        }
      ]),
    });
    await Fluttertoast.showToast(
      msg: "item has been removed from your wishlist",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
    );
  }

  @override
  removeAllWishList() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await getIt
          .get<FirebaseServices>()
          .getUserDocument()!
          .update({"wishList": []});
    }
  }
}
