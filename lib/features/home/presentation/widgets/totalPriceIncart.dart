import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/customBtn.dart';

import 'price_per_widget.dart';

class TotalPriceInCart extends StatelessWidget {
  const TotalPriceInCart({super.key, required this.price, required this.ontap});
  final String price;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.total,
                      style: AppStyles.style22.copyWith(
                        color: const Color(0xffe57676),
                      ),
                    ),
                    PricePerKgText(
                      price: price,
                      kg: AppStrings.oneKg,
                    ),
                  ],
                ),
                CustomBtn(
                  ontap: ontap,
                  title: AppStrings.inCart,
                  padding: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
