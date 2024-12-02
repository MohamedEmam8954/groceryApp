import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import 'package:grocery/core/errors/server_failures.dart';

abstract class AuthRepo {
  Future<Either<Failures, void>> siginUp(
      {required String email, required String password});

  Future<Either<Failures, void>> signIn(
      {required String email, required String password});
  Future<Either<Failures, void>> signInWithGoogle(BuildContext context);

  Future<Either<Failures, void>> forgetPassword(String email);
}
