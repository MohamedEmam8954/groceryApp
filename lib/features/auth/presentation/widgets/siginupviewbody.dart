import 'package:flutter/material.dart';
import 'package:grocery/features/auth/presentation/widgets/authbackground.dart';
import 'package:grocery/features/auth/presentation/widgets/signupviewdetails.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AuthBackground(),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        const SignUPViewDetails(),
      ],
    );
  }
}
