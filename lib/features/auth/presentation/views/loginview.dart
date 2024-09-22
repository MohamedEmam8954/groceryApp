import 'package:flutter/material.dart';
import 'package:grocery/features/auth/presentation/widgets/loginviewbody.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
