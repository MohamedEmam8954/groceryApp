import 'package:flutter/material.dart';
import 'package:grocery/core/widgets/backwidget.dart';
import 'package:grocery/features/auth/presentation/widgets/authbackground.dart';
import 'package:grocery/features/auth/presentation/widgets/forgetpassworddetails.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AuthBackground(),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        const BackWidget(
          iconcolor: true,
        ),
        const ForgetPasswordDetails(),
      ],
    );
  }
}
