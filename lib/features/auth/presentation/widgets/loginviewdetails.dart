import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/features/auth/presentation/widgets/customdivider.dart';
import 'package:grocery/features/auth/presentation/widgets/customloginauth.dart';
import 'package:grocery/features/auth/presentation/widgets/donthaveaccountbtn.dart';
import 'package:grocery/features/auth/presentation/widgets/signunwithgooglebtn.dart';

class LoginViewDetails extends StatelessWidget {
  const LoginViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          SignInWithGoogleBtn(ontap: () {}),
          const SizedBox(
            height: 15,
          ),
          //! divider
          const CustomDivider(),
          const SizedBox(
            height: 15,
          ),
          CustomBtn(
            ontap: () {},
            radius: 8,
            title: AppStrings.continueasguest,
            color: Colors.black,
            isBorder: false,
            padding: 9,
          ),
          const SizedBox(
            height: 15,
          ),
          //! don't have an account
          DontHaveAnAccountBtn(ontap: () {}),
        ],
      ),
    );
  }
}
