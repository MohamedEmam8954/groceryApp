import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/features/auth/data/repo/repo/firebase_repo_imp.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/userData/userdata_cubit.dart';
import 'package:grocery/features/profile/presentation/widgets/ProfileViewBody.dart';

class Profileview extends StatelessWidget {
  const Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) =>
              UserdataCubit(getIt.get<FirebaseRepoImp>())..fetchUserData(),
          child: const ProfileViewBody(),
        ),
      ),
    );
  }
}
