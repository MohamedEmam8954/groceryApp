import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/core/errors/server_failures.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/features/auth/data/repo/authrepo/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  @override
  Future<Either<Failures, void>> siginUp(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailures.fromFirebaseAuth(e));
    } catch (e) {
      return left(Failures(errormessage: AppStrings.unKnownError));
    }
  }
}
