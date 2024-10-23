import 'package:dartz/dartz.dart';

import 'package:grocery/core/errors/server_failures.dart';

abstract class AuthRepo {
  Future<Either<Failures, void>> siginUp(
      {required String email, required String password});
}
