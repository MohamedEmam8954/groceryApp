import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';

class IncartBtn extends StatelessWidget {
  const IncartBtn({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).focusColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Text(
          AppStrings.inCart,
          style: AppStyles.style18,
        ),
      ),
    );
  }
}
