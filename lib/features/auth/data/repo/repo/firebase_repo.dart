import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseRepo {
  Future<void> addUser({
    required String fullName,
    required String address,
    required Timestamp createdAt,
    required String email,
  });
  Future<void> addUserFromGoogle({
    required String fullName,
    required Timestamp createdAt,
    required String email,
  });

  Future<Map<String, dynamic>?> fetchUserData();
}
