import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/customBtn.dart';

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
          Flexible(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "${AppStrings.total} \$3.99", // Adjusted the value to be simpler
                style: AppStyles.style20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
