import 'package:flutter/material.dart';

import 'package:grocery/profile/presentation/widgets/account_Setting.dart';
import 'package:grocery/profile/presentation/widgets/customUserInfo.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomUserInfo(),
        Divider(
          thickness: 2,
        ),
        AccountSettings(),
      ],
    );
  }
}
