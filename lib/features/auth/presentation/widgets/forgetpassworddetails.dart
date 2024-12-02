import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/auth/presentation/widgets/custom_forgetpassword_auth.dart';

class ForgetPasswordDetails extends StatelessWidget {
  const ForgetPasswordDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Text(
            AppStrings.forgetPassword,
            style: AppStyles.style28.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          const CustomForgetPasswordAuth(),
        ],
      ),
    );
  }
}
