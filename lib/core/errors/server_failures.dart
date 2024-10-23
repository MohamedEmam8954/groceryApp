import 'package:firebase_auth/firebase_auth.dart';

class Failures {
  final String errormessage;

  Failures({required this.errormessage});
}

class ServerFailures extends Failures {
  ServerFailures({required super.errormessage});

  factory ServerFailures.fromFirebaseAuth(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return ServerFailures(errormessage: 'The email address is not valid.');
      case 'user-disabled':
        return ServerFailures(errormessage: 'This user has been disabled.');
      case 'user-not-found':
        return ServerFailures(errormessage: 'No user found for that email.');
      case 'wrong-password':
        return ServerFailures(errormessage: 'Incorrect password.');
      case 'email-already-in-use':
        return ServerFailures(errormessage: 'The email is already registered.');
      case 'operation-not-allowed':
        return ServerFailures(
            errormessage: 'This sign-in method is not enabled.');
      case 'weak-password':
        return ServerFailures(
            errormessage: 'The password provided is too weak.');
      case 'too-many-requests':
        return ServerFailures(
            errormessage: 'Too many attempts. Try again later.');
      case 'network-request-failed':
        return ServerFailures(
            errormessage: 'Network error. Please check your connection.');
      default:
        return ServerFailures(errormessage: 'An unexpected error occurred.');
    }
  }
}
