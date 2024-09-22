import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          endIndent: 10,
          color: Colors.white,
          thickness: 3,
        )),
        Text(
          AppStrings.or,
          style: AppStyles.style20.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Expanded(
          child: Divider(
            indent: 10,
            color: Colors.white,
            thickness: 3,
          ),
        ),
      ],
    );
  }
}
