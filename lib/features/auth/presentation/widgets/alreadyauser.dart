import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';

class AlreadyaUser extends StatelessWidget {
  const AlreadyaUser({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.alreadyauser,
          style: AppStyles.style20
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: ontap,
          child: Text(
            AppStrings.signIn,
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
