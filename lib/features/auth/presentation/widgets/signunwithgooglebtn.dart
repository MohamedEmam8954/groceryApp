import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';

class SignInWithGoogleBtn extends StatelessWidget {
  const SignInWithGoogleBtn({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          children: [
            Container(
              color: Colors.white,
              child: Image.asset(
                width: 45,
                height: 45,
                Assets.assetsImagesGoogle,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              AppStrings.signInWithGoogle,
              style: AppStyles.style20.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
