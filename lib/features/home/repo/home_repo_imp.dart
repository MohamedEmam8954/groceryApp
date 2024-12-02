import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/core/errors/server_failures.dart';
import 'package:grocery/core/services/firebase_services.dart';
import 'package:grocery/core/utils/dependency_injection.dart';

import 'package:grocery/features/home/repo/home_repo.dart';
import 'package:uuid/uuid.dart';

class HomeRepoImp implements HomeRepo {
  @override
  Either<Failures, Stream<QuerySnapshot>> fetchData() {
    try {
      var data = getIt.get<FirebaseServices>().fetchProductsData();

      return right(data);
    } on FirebaseException catch (e) {
      log(e.toString());
      return left(
        Failures(errormessage: e.message!),
      );
    } catch (e) {
      log(e.toString());
      return left(Failures(errormessage: e.toString()));
    }
  }

  @override
  addProductToCart({
    required String quantity,
    required String productid,
  }) async {
    var cart = getIt.get<FirebaseServices>().getUserDocument();
    if (cart != null) {
      String uuid = const Uuid().v4();
      await cart.update({
        "userCart": FieldValue.arrayUnion(
          [
            {
              "quantity": quantity,
              "productid": productid,
              "uuid": uuid,
            }
          ],
        )
      });
    }
    await Fluttertoast.showToast(
      msg: "item has been added to  your cart",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
    );
  }

  @override
  Future<DocumentSnapshot> fetchDataFromCart() async {
    return await getIt.get<FirebaseServices>().getUserDocument()!.get();
  }
}
