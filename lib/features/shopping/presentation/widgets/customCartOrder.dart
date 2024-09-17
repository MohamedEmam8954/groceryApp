import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/utils/customBtn.dart';

class CustomCartOrder extends StatelessWidget {
  const CustomCartOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBtn(
            ontap: () {},
            title: AppStrings.orderNow,
            width: 115,
            hight: 46,
          ),
          Text(
            "${AppStrings.total}\$ 3.98",
            style: AppStyles.style20,
          ),
        ],
      ),
    );
  }
}
