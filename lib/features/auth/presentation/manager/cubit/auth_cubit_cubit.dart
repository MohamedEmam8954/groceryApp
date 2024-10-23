import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/errors/server_failures.dart';
import 'package:grocery/features/auth/data/repo/authrepo/auth_repo.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit(this.authRepo) : super(AuthCubitInitial());
  AuthRepo authRepo;
  signUp({required String email, required String password}) async {
    emit(AuthCubitSignUploading());
    Either<Failures, void> data =
        await authRepo.siginUp(email: email, password: password);
    data.fold(
      (failures) =>
          emit(AuthCubitSignUPFailures(errorMessage: failures.errormessage)),
      (_) => emit(AuthCubitSignUPSucess()),
    );
  }
}
