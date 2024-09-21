import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/profile/presentation/widgets/customSignout.dart';

abstract class GlobalMethod {
  static Future warningDialog(
    context, {
    required String title,
    required String subTitle,
    required VoidCallback onTapOK,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: CustomSignOut(
            title: title,
          ),
          content: Text(subTitle),
          actions: [
            TextButton(
              onPressed: () {
                //!

                log("Cancel");
                Navigator.pop(context);
              },
              child: Text(
                AppStrings.cancel,
                style: AppStyles.style17,
              ),
            ),
            TextButton(
              onPressed: () {
                //!
                log("Sign Out");
                Navigator.pop(context);
              },
              child: Text(
                AppStrings.ok,
                style: AppStyles.style17.copyWith(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
