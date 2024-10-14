import 'package:flutter/material.dart';

import 'package:grocery/core/utils/app_styles.dart';

class PricePerKgText extends StatelessWidget {
  const PricePerKgText(
      {super.key, required this.price, this.color, required this.kg});
  final double price;
  final String kg;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: "\$$price",
          style: AppStyles.style22.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        TextSpan(
          text: "/$kg",
          style: AppStyles.style15.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
