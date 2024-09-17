import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_styles.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key,
      required this.ontap,
      required this.title,
      required this.width,
      required this.hight,
      this.color});
  final VoidCallback ontap;
  final String title;
  final double width, hight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: hight,
        decoration: BoxDecoration(
          color: color ?? Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: AppStyles.style18.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
