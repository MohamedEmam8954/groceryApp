import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_styles.dart';

class YourOrderItem extends StatelessWidget {
  const YourOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: size.width * 0.2,
              height: size.width * 0.23,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.assetsImagesCatVeg),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  "Title x12",
                  style: AppStyles.style20,
                ),
                Text(
                  "Paid:\$12.8 ",
                  style: AppStyles.style18.copyWith(
                      color: Colors.black38, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              width: 90,
            ),
            Text(
              "03/08/2024",
              style: AppStyles.style20.copyWith(
                  color: Colors.black.withOpacity(0.59),
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
        const Divider(
          thickness: 1.5,
          color: Colors.black45,
        ),
      ],
    );
  }
}
