import 'package:flutter/material.dart';
import 'package:grocery/features/auth/presentation/widgets/authbackground.dart';
import 'package:grocery/features/auth/presentation/widgets/loginviewdetails.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Expanded(
          child: AuthBackground(),
        ),
        LoginViewDetails(),
      ],
    );
  }
}
