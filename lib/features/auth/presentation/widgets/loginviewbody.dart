import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/constant/constant.dart';
import 'package:grocery/core/cache/my_cache_helper.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/core/utils/warningdialog.dart';
import 'package:grocery/core/widgets/loading_manager.dart';
import 'package:grocery/features/auth/presentation/manager/cubit/auth_cubit_cubit.dart';
import 'package:grocery/features/auth/presentation/widgets/authbackground.dart';
import 'package:grocery/features/auth/presentation/widgets/loginviewdetails.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is AuthCubitSignInSucess) {
          User? user = FirebaseAuth.instance.currentUser;
          if (user!.emailVerified) {
            getIt
                .get<MyCacheHelper>()
                .sendData(data: true, key: AppConstant.hasAnAccount);
            pushAndReplacement(context, AppRouter.navigation);
          } else {
            GlobalMethod.errorDialog(context,
                subTitle: AppStrings.sendEmailVerification);
          }
        } else if (state is AuthCubitSignInFailures) {
          GlobalMethod.errorDialog(context, subTitle: state.errorMessage);
        }
      },
      builder: (context, state) {
        return LoadingManager(
          isloading: state is AuthCubitSignInloading ? true : false,
          child: Stack(
            children: [
              const AuthBackground(),
              Container(
                color: Colors.black.withOpacity(0.7),
              ),
              const LoginViewDetails(),
            ],
          ),
        );
      },
    );
  }
}
