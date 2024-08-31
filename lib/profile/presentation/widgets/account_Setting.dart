import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/profile/presentation/widgets/SwitchThemeApp.dart';
import 'package:grocery/profile/presentation/widgets/meanuOptions.dart';
import 'package:iconly/iconly.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MeanuOptions(
              ontap: () {},
              leadingIcon: IconlyLight.location,
              title: AppStrings.address),
          MeanuOptions(
              ontap: () {},
              leadingIcon: IconlyLight.bag,
              title: AppStrings.orders),
          MeanuOptions(
              ontap: () {},
              leadingIcon: IconlyLight.heart,
              title: AppStrings.wishList),
          MeanuOptions(
              ontap: () {},
              leadingIcon: IconlyLight.show,
              title: AppStrings.viewed),
          MeanuOptions(
              ontap: () {},
              leadingIcon: IconlyLight.lock,
              title: AppStrings.forgetPassword),
          const SwitchThemeApp(),
          MeanuOptions(
              ontap: () {},
              leadingIcon: IconlyLight.logout,
              title: AppStrings.logout),
        ],
      ),
    );
  }
}
