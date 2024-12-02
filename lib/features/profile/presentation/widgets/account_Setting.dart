import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/services/firebase_services.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/core/utils/warningdialog.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/customtextformfield.dart';
import 'package:grocery/features/profile/presentation/widgets/SwitchThemeApp.dart';
import 'package:grocery/features/profile/presentation/widgets/meanuOptions.dart';

import 'package:iconly/iconly.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  String address = '';

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;

    return Column(
      children: [
        uid == null
            ? MeanuOptions(
                ontap: () async {
                  await _showAddressDialog(context);
                },
                leadingIcon: IconlyLight.profile,
                title: AppStrings.address,
                subtitle: address.isNotEmpty ? address : AppStrings.subTitles,
              )
            : StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Loading indicator
                  }
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Text("No user data available");
                  }

                  address =
                      snapshot.data?.get('address') ?? AppStrings.subTitles;
                  return MeanuOptions(
                    ontap: () async {
                      await _showAddressDialog(context);
                    },
                    leadingIcon: IconlyLight.profile,
                    title: AppStrings.address,
                    subtitle:
                        address.isNotEmpty ? address : AppStrings.subTitles,
                  );
                },
              ),
        MeanuOptions(
          ontap: () {
            navTo(context, AppRouter.orderView);
          },
          leadingIcon: IconlyLight.bag,
          title: AppStrings.orders,
        ),
        MeanuOptions(
          ontap: () {
            navTo(context, AppRouter.wishListView);
          },
          leadingIcon: IconlyLight.heart,
          title: AppStrings.wishList,
        ),
        MeanuOptions(
          ontap: () {
            navTo(context, AppRouter.historyView);
          },
          leadingIcon: IconlyLight.show,
          title: AppStrings.viewed,
        ),
        MeanuOptions(
          ontap: () {
            navTo(context, AppRouter.forgetpassword);
          },
          leadingIcon: IconlyLight.lock,
          title: AppStrings.forgetPassword,
        ),
        const SwitchThemeApp(),
        MeanuOptions(
          ontap: () {
            if (user == null) {
              navTo(context, AppRouter.loginView);
              return;
            }
            GlobalMethod.warningDialog(
              context,
              title: AppStrings.signOut,
              subTitle: AppStrings.confirmSignout,
              onTapOK: () async {
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();
                pushAndReplacement(context, AppRouter.loginView);
              },
            );
          },
          leadingIcon: user != null ? IconlyLight.logout : IconlyLight.login,
          title: user != null ? AppStrings.logout : AppStrings.login,
        ),
      ],
    );
  }

  Future<void> _showAddressDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppStrings.update),
          content: Form(
            key: _formKey,
            child: CustomTextFormField(
              textInputType: TextInputType.streetAddress,
              maxlines: 5,
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
                  user != null
                      ? getIt
                          .get<FirebaseServices>()
                          .getUserDocument()!
                          .update({"address": textEditingController.text})
                      : null;
                  Navigator.of(context).pop();
                  textEditingController.clear();
                }
              },
              child: const Text(AppStrings.update),
            ),
          ],
        );
      },
    );
  }
}
