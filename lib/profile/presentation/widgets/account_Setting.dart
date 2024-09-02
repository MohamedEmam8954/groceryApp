import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/utils/customtextformfield.dart';
import 'package:grocery/profile/presentation/widgets/SwitchThemeApp.dart';
import 'package:grocery/profile/presentation/widgets/meanuOptions.dart';
import 'package:iconly/iconly.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MeanuOptions(
          ontap: () async {
            await _showAddressDialog(context);
          },
          leadingIcon: IconlyLight.profile,
          title: AppStrings.address,
          subtitle: "Subtitle",
        ),
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
            ontap: () async {
              await _showLogoutDialog(context);
            },
            leadingIcon: IconlyLight.logout,
            title: AppStrings.logout),
      ],
    );
  }

  Future _showAddressDialog(context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppStrings.update),
          content: Form(
            key: _formKey,
            child: CustomTextFormField(
              hintext: AppStrings.youraddress,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return AppStrings.adressIsRequired;
                }
                return null;
              },
              controller: textEditingController,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  log("Text editing is: ${textEditingController.text}");
                  Navigator.of(context).pop();
                  textEditingController.clear();
                }
              },
              child: const Text(AppStrings.update),
            )
          ],
        );
      },
    );
  }

  Future _showLogoutDialog(context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppStrings.signOut),
          content: const Text(AppStrings.confirmSignout),
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
