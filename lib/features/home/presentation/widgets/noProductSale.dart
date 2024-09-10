import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';

class NoProductSale extends StatelessWidget {
  const NoProductSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset(
            Assets.assetsImagesBox,
            width: 300,
            height: 300,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppStrings.noProductsOnSale,
              style: AppStyles.style30,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
