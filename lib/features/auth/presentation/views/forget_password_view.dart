import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/features/auth/data/repo/authrepo/auth_repo_imp.dart';
import 'package:grocery/features/auth/presentation/manager/cubit/auth_cubit_cubit.dart';
import 'package:grocery/features/auth/presentation/widgets/forgetpasswordviewbody.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AuthCubit(getIt.get<AuthRepoImp>()),
        child: const Scaffold(
          body: ForgetPasswordViewBody(),
        ),
      ),
    );
  }
}
