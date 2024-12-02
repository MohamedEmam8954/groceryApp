import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:grocery/core/errors/server_failures.dart';

abstract class HomeRepo {
  Either<Failures, Stream<QuerySnapshot>> fetchData();
  addProductToCart({required String quantity, required String productid});

  Future<DocumentSnapshot> fetchDataFromCart();
}
