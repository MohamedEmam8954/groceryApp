import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_styles.dart';

class MeanuOptions extends StatelessWidget {
  const MeanuOptions({
    super.key,
    required this.ontap,
    required this.leadingIcon,
    required this.title,
  });
  final VoidCallback ontap;
  final IconData leadingIcon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        onTap: ontap,
        leading: Icon(
          leadingIcon,
          color: Colors.grey,
        ),
        title: Text(
          title,
          style: AppStyles.style22.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
        ),
      ),
    );
  }
}
