import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_styles.dart';

class CustomUserInfo extends StatelessWidget {
  const CustomUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "Hi, ",
                    style: AppStyles.style32.copyWith(
                      fontWeight: FontWeight.w500,
                    )),
                TextSpan(
                  text: "Mohamed Emam",
                  style: AppStyles.style24.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "test@test.com",
            style: AppStyles.style18.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
