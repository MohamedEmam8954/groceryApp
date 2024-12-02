import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:grocery/core/services/firebase_services.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/features/shopping/data/repo/cart_repo.dart';

class CartRepoImp implements CartRepo {
  @override
  Future<void> removeItemFromCart(itemToremove) async {
    var cart = getIt.get<FirebaseServices>().getUserDocument();
    if (cart != null) {
      try {
        await cart.update({
          "userCart": FieldValue.arrayRemove([itemToremove])
        });
      } catch (e) {
        log("this error when you want to remove items");
      }

      await Fluttertoast.showToast(
        msg: "item has been removed from  your cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
      );
    }
  }

  @override
  Future<void> removeAllItems() async {
    var cart = getIt.get<FirebaseServices>().getUserDocument();
    if (cart != null) {
      try {
        await cart.update({"userCart": []});
      } catch (e) {
        log("this error when you want to remove items");
      }
    }
  }
}
