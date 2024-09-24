import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';

class ForgetPasswordBtn extends StatelessWidget {
  const ForgetPasswordBtn({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: ontap,
        child: Text(
          AppStrings.kforgetpassword,
          style: AppStyles.style18.copyWith(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
