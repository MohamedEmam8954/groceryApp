import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:iconly/iconly.dart';

class MeanuOptions extends StatelessWidget {
  const MeanuOptions(
      {super.key,
      required this.ontap,
      required this.leadingIcon,
      required this.title,
      this.subtitle});
  final VoidCallback ontap;
  final IconData leadingIcon;
  final String title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        onTap: ontap,
        leading: Icon(
          leadingIcon,
          color: Colors.grey,
        ),
        title: Text(
          title,
          style: AppStyles.style22.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle != null ? subtitle! : ""),
        trailing: const Icon(
          IconlyLight.arrow_right_2,
          color: Colors.grey,
        ),
      ),
    );
  }
}
