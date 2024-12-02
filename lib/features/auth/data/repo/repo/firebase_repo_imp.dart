import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/core/services/firebase_services.dart';
import 'package:grocery/features/auth/data/repo/repo/firebase_repo.dart';
import 'package:grocery/core/utils/dependency_injection.dart';

class FirebaseRepoImp implements FirebaseRepo {
  @override
  Future<void> addUser({
    required String fullName,
    required String address,
    required Timestamp createdAt,
    required String email,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;
    user.updateDisplayName(fullName);
    user.reload();
    var firebaseService = getIt.get<FirebaseServices>().getUserDocument();
    try {
      await firebaseService!.set({
        'uid': uid,
        'fullName': fullName,
        'address': address,
        'createdAt': createdAt,
        'email': email,
        'wishList': [],
        'userCart': [],
      });
      log("User added successfully to Firestore.");
    } catch (e) {
      log("Error adding user to Firestore: ${e.toString()}");
    }
  }

  @override
  Future<void> addUserFromGoogle({
    required String fullName,
    required Timestamp createdAt,
    required String email,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;

    var firebaseService = getIt.get<FirebaseServices>().getUserDocument();
    final userData = await FirebaseRepoImp().fetchUserData();
    try {
      await firebaseService!.set({
        'uid': uid,
        'fullName': fullName,
        'createdAt': createdAt,
        'address': userData?['address'] != null ? userData!["address"] : "",
        'email': email,
        'wishList': userData?['wishList'] != null ? userData!['wishList'] : [],
        'userCart': userData?['userCart'] != null ? userData!['userCart'] : [],
      });
      log("User added successfully to Firestore.");
    } catch (e) {
      log("Error adding user to Firestore: ${e.toString()}");
    }
  }

  @override
  Future<Map<String, dynamic>?> fetchUserData() async {
    DocumentSnapshot documentSnapshot =
        await getIt.get<FirebaseServices>().getUserDocument()!.get();
    if (documentSnapshot.exists) {
      return documentSnapshot.data() as Map<String, dynamic>;
    }

    return null;
  }
}
