import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/features/auth/data/repo/repo/firebase_repo_imp.dart';
import 'package:grocery/core/utils/warningdialog.dart';
import 'package:grocery/core/widgets/loading_manager.dart';
import 'package:grocery/features/auth/presentation/manager/cubit/auth_cubit_cubit.dart';
import 'package:grocery/features/auth/presentation/widgets/authbackground.dart';
import 'package:grocery/features/auth/presentation/widgets/signupviewdetails.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/userData/userdata_cubit.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is AuthCubitSignUPSucess) {
          context.read<UserdataCubit>().uploadUserData(
              address: state.address,
              fullName: state.fullName,
              email: state.email,
              createdAt: state.createdAs);
          popAppRouter(context);
        } else if (state is AuthCubitSignUPFailures) {
          GlobalMethod.errorDialog(context, subTitle: state.errorMessage);
        }
      },
      builder: (context, state) {
        return LoadingManager(
          isloading: state is AuthCubitSignUploading ? true : false,
          child: Stack(
            children: [
              const AuthBackground(),
              Container(
                color: Colors.black.withOpacity(0.7),
              ),
              const SignUPViewDetails(),
            ],
          ),
        );
      },
    );
  }
}
