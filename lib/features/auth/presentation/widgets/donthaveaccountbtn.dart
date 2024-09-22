import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';

class DontHaveAnAccountBtn extends StatelessWidget {
  const DontHaveAnAccountBtn({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.donthaveaccount,
          style: AppStyles.style20
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: ontap,
          child: Text(
            AppStrings.signup,
            style: AppStyles.style18.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
