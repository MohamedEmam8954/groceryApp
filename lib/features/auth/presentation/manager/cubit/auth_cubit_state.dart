part of 'auth_cubit_cubit.dart';

@immutable
sealed class AuthCubitState {}

// ! states for signup
final class AuthCubitInitial extends AuthCubitState {}

final class AuthCubitSignUploading extends AuthCubitState {}

final class AuthCubitSignUPSucess extends AuthCubitState {
  final String fullName, address, email;
  final Timestamp createdAs;

  AuthCubitSignUPSucess({
    required this.fullName,
    required this.address,
    required this.email,
    required this.createdAs,
  });
}

final class AuthCubitSignUPFailures extends AuthCubitState {
  final String errorMessage;

  AuthCubitSignUPFailures({required this.errorMessage});
}
// ! states for signin

final class AuthCubitSignInloading extends AuthCubitState {}

final class AuthCubitSignInSucess extends AuthCubitState {}

final class AuthCubitSignInFailures extends AuthCubitState {
  final String errorMessage;

  AuthCubitSignInFailures({required this.errorMessage});
}
// ! states for signinwithgoogle

final class SignInWithGoogleloading extends AuthCubitState {}

final class SignInWithGoogleSucess extends AuthCubitState {}

final class SignInWithGoogleFailures extends AuthCubitState {
  final String errorMessage;

  SignInWithGoogleFailures({required this.errorMessage});
}

// ! states for forgetPassword
final class LoadingForgetPassword extends AuthCubitState {}

final class SucessForgetPassword extends AuthCubitState {}

final class FailureForgetPassword extends AuthCubitState {
  final String errorMessage;

  FailureForgetPassword({required this.errorMessage});
}
