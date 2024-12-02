import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/show_toast.dart';
import 'package:grocery/core/widgets/backwidget.dart';
import 'package:grocery/core/widgets/loading_manager.dart';
import 'package:grocery/features/auth/presentation/manager/cubit/auth_cubit_cubit.dart';
import 'package:grocery/features/auth/presentation/widgets/authbackground.dart';
import 'package:grocery/features/auth/presentation/widgets/forgetpassworddetails.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is SucessForgetPassword) {
          showToast(msg: "please verify your email to change password");
        }
      },
      builder: (context, state) {
        return LoadingManager(
          isloading: state is LoadingForgetPassword ? true : false,
          child: Stack(
            children: [
              const AuthBackground(),
              Container(
                color: Colors.black.withOpacity(0.7),
              ),
              const BackWidget(
                iconcolor: true,
              ),
              const ForgetPasswordDetails(),
            ],
          ),
        );
      },
    );
  }
}
