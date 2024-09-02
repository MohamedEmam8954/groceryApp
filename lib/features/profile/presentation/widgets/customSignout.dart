import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';

class CustomSignOut extends StatelessWidget {
  const CustomSignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.assetsImagesWarningSign,
          width: 20,
          height: 20,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(AppStrings.signOut),
      ],
    );
  }
}
