import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_styles.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key,
      required this.ontap,
      this.title,
      this.width,
      this.hight,
      this.color,
      this.padding,
      this.icon,
      this.textcolor,
      this.bordercolor,
      required this.radius,
      this.isBorder = false});
  final VoidCallback ontap;
  final String? title;
  final IconData? icon;
  final double? width, hight, padding;
  final Color? color, textcolor, bordercolor;
  final double radius;
  final bool isBorder;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(padding ?? 0),
        alignment: Alignment.center,
        width: width,
        height: hight,
        decoration: BoxDecoration(
          color: color ?? Colors.green,
          borderRadius: BorderRadius.circular(10),
          border:
              isBorder ? Border.all(color: textcolor ?? Colors.white) : null,
        ),
        child: icon is IconData
            ? Icon(
                icon,
                size: 22,
                color: Colors.white,
              )
            : Text(
                title!,
                style: AppStyles.style18.copyWith(
                  fontWeight: FontWeight.w700,
                  color: textcolor ?? Colors.white,
                ),
              ),
      ),
    );
  }
}
