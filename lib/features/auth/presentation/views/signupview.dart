import 'package:flutter/material.dart';
import 'package:grocery/features/auth/presentation/widgets/siginupviewbody.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignUpViewBody(),
      ),
    );
  }
}
