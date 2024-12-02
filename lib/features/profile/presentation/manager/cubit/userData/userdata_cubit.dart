import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/features/auth/data/repo/repo/firebase_repo.dart';
part 'userdata_state.dart';

class UserdataCubit extends Cubit<UserdataState> {
  UserdataCubit(this.firebaseRepo) : super(UserdataInitial());
  FirebaseRepo firebaseRepo;
  uploadUserData(
      {required String fullName,
      required String address,
      required Timestamp createdAt,
      required String email}) async {
    await firebaseRepo.addUser(
        fullName: fullName,
        address: address,
        createdAt: createdAt,
        email: email);
  }

  uploadUserDataFromGoogle(
      {required String fullName,
      required Timestamp createdAt,
      required String email}) async {
    await firebaseRepo.addUserFromGoogle(
        fullName: fullName, createdAt: createdAt, email: email);
  }

  fetchUserData() async {
    try {
      emit(UserdataLoading());
      final userData = await firebaseRepo.fetchUserData();
      if (userData != null) {
        String email = userData['email'];
        String address = userData['address'];
        String fullName = userData['fullName'];
        log("the email is $email,the address is $address");
        emit(Userdatasucess(email: email, name: fullName, adress: address));
      } else {
        log("user Data is null from fetchuser data cubit");
        emit(Userdatafailure(
            errorMessage: "user Data is null from fetchuser data cubit"));
      }
    } catch (e) {
      log(e.toString());
      emit(Userdatafailure(errorMessage: e.toString()));
    }
  }
}
