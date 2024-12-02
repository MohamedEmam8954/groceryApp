import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/errors/server_failures.dart';
import 'package:grocery/features/auth/data/repo/authrepo/auth_repo.dart';
part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit(this.authRepo) : super(AuthCubitInitial());
  AuthRepo authRepo;
  signUp(
      {required String email,
      required String password,
      required String name,
      required String address,
      required Timestamp createdas}) async {
    emit(AuthCubitSignUploading());
    Either<Failures, void> data =
        await authRepo.siginUp(email: email, password: password);
    data.fold(
        (failures) =>
            emit(AuthCubitSignUPFailures(errorMessage: failures.errormessage)),
        (_) => emit(AuthCubitSignUPSucess(
            fullName: name,
            address: address,
            email: email,
            createdAs: createdas)));
  }

  signIn({required String email, required String password}) async {
    emit(AuthCubitSignInloading());
    Either<Failures, void> data =
        await authRepo.signIn(email: email, password: password);
    data.fold(
      (failures) => emit(
        AuthCubitSignInFailures(errorMessage: failures.errormessage),
      ),
      (_) => emit(AuthCubitSignInSucess()),
    );
  }

  signInWithGoogle(BuildContext context) async {
    emit(SignInWithGoogleloading());
    Either<Failures, void> data = await authRepo.signInWithGoogle(context);
    data.fold(
      (failures) => emit(
        SignInWithGoogleFailures(errorMessage: failures.errormessage),
      ),
      (_) => emit(SignInWithGoogleSucess()),
    );
  }

  forgetPassword({required String email}) async {
    emit(LoadingForgetPassword());
    Either<Failures, void> data = await authRepo.forgetPassword(email);
    data.fold(
      (failures) =>
          emit(FailureForgetPassword(errorMessage: failures.errormessage)),
      (_) => emit(SucessForgetPassword()),
    );
  }
}
