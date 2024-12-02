import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery/core/errors/server_failures.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/features/auth/data/repo/authrepo/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  @override
  Future<Either<Failures, void>> siginUp(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCredential.user!.sendEmailVerification();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailures.fromFirebaseerrors(e));
    } catch (e) {
      return left(Failures(errormessage: AppStrings.unKnownError));
    }
  }

  @override
  Future<Either<Failures, void>> signIn(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailures.fromFirebaseerrors(e));
    } catch (e) {
      return left(Failures(errormessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> signInWithGoogle(BuildContext context) async {
    try {
      final googleSignIn = GoogleSignIn();

      // Proceed with signing in
      final googleAccount = await googleSignIn.signIn();

      if (googleAccount != null) {
        final googleAuth = await googleAccount.authentication;
        if (googleAuth.accessToken != null && googleAuth.idToken != null) {
          await FirebaseAuth.instance.signInWithCredential(
            GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            ),
          );
          pushAndReplacement(context, AppRouter.navigation);
          return right(null);
        }
      }
      return left(Failures(errormessage: "sign with google was cancled"));
    } on FirebaseAuthException catch (e) {
      return left(ServerFailures.fromFirebaseerrors(e));
    } catch (e) {
      return left(Failures(errormessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> forgetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(null);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return left(ServerFailures.fromFirebaseerrors(e));
    }
  }
}
