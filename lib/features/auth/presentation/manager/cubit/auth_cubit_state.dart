part of 'auth_cubit_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class AuthCubitSignUploading extends AuthCubitState {}

final class AuthCubitSignUPSucess extends AuthCubitState {}

final class AuthCubitSignUPFailures extends AuthCubitState {
  final String errorMessage;

  AuthCubitSignUPFailures({required this.errorMessage});
}
