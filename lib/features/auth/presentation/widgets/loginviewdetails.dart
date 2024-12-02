import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/app/groceryapp.dart';
import 'package:grocery/constant/constant.dart';
import 'package:grocery/core/cache/my_cache_helper.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/core/widgets/loading_manager.dart';
import 'package:grocery/features/auth/data/repo/repo/firebase_repo_imp.dart';
import 'package:grocery/features/auth/presentation/manager/cubit/auth_cubit_cubit.dart';
import 'package:grocery/features/auth/presentation/widgets/customdivider.dart';
import 'package:grocery/features/auth/presentation/widgets/customloginauth.dart';
import 'package:grocery/features/auth/presentation/widgets/donthaveaccountbtn.dart';
import 'package:grocery/features/auth/presentation/widgets/signunwithgooglebtn.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/userData/userdata_cubit.dart';

class LoginViewDetails extends StatelessWidget {
  const LoginViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = context.read<AuthCubit>();
    bool hasAnAccount =
        getIt.get<MyCacheHelper>().getData(key: AppConstant.hasAnAccount) ??
            false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              AppStrings.welcomeBack,
              style: AppStyles.style28.copyWith(color: Colors.white),
            ),
            Text(
              AppStrings.signInToContinue,
              style: AppStyles.style18.copyWith(
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 25,
            ),
            //! custom textformfield
            const CustomLoginAuth(),
            const SizedBox(
              height: 15,
            ),
            //! sigin in with google
            BlocProvider(
              create: (context) => UserdataCubit(getIt.get<FirebaseRepoImp>()),
              child: BlocConsumer<AuthCubit, AuthCubitState>(
                listener: (context, state) {
                  if (state is SignInWithGoogleSucess) {
                    User? user = FirebaseAuth.instance.currentUser;
                    context.read<UserdataCubit>().uploadUserDataFromGoogle(
                        fullName: user!.displayName!,
                        createdAt: Timestamp.now(),
                        email: user.email!);

                    getIt
                        .get<MyCacheHelper>()
                        .sendData(data: true, key: AppConstant.hasAnAccount);
                  }
                },
                builder: (context, state) {
                  return LoadingManager(
                    isloading: state is SignInWithGoogleloading ? true : false,
                    child: SignInWithGoogleBtn(ontap: () {
                      authCubit.signInWithGoogle(context);
                    }),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //! divider
            !hasAnAccount
                ? Container()
                : Column(
                    children: [
                      const CustomDivider(),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomBtn(
                        ontap: () {
                          pushAndReplacement(context, AppRouter.navigation);
                        },
                        radius: 8,
                        title: AppStrings.continueasguest,
                        color: Colors.black,
                        isBorder: false,
                        padding: 9,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
            //! don't have an account
            DontHaveAnAccountBtn(
              ontap: () {
                navTo(context, AppRouter.signUpView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
