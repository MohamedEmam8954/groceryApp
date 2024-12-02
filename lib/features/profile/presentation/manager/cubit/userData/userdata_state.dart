part of 'userdata_cubit.dart';

sealed class UserdataState {}

final class UserdataInitial extends UserdataState {}

final class UserdataLoading extends UserdataState {}

final class Userdatasucess extends UserdataState {
  final String email, name, adress;

  Userdatasucess(
      {required this.email, required this.name, required this.adress});
}

final class Userdatafailure extends UserdataState {
  final String errorMessage;

  Userdatafailure({required this.errorMessage});
}

final class UserdataSucessfullyUploaded extends UserdataState {}
