import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/features/auth/data/repo/authrepo/auth_repo_imp.dart';
import 'package:grocery/features/auth/data/repo/repo/firebase_repo_imp.dart';
import 'package:grocery/features/auth/presentation/manager/cubit/auth_cubit_cubit.dart';
import 'package:grocery/features/auth/presentation/widgets/siginupviewbody.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/userData/userdata_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(getIt.get<AuthRepoImp>()),
            ),
            BlocProvider(
              create: (context) => UserdataCubit(getIt.get<FirebaseRepoImp>()),
            ),
          ],
          child: const SignUpViewBody(),
        ),
      ),
    );
  }
}
