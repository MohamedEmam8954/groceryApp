import 'package:flutter/material.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/auth/presentation/widgets/alreadyauser.dart';
import 'package:grocery/features/auth/presentation/widgets/customsignupauth.dart';

class SignUPViewDetails extends StatelessWidget {
  const SignUPViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
              AppStrings.welcome,
              style: AppStyles.style28.copyWith(color: Colors.white),
            ),
            Text(
              AppStrings.signUpToContinue,
              style: AppStyles.style18.copyWith(
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 25,
            ),
            //! custom textformfield
            const CustomSignUPAuth(),
            const SizedBox(
              height: 15,
            ),
            AlreadyaUser(ontap: () {
              popAppRouter(context);
            })
          ],
        ),
      ),
    );
  }
}
