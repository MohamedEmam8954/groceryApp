import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:iconly/iconly.dart';

class OnSaleRotated extends StatelessWidget {
  const OnSaleRotated({super.key});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Row(
        children: [
          Text(
            AppStrings.onsale,
            style: AppStyles.style22.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            IconlyLight.discount,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
