import 'package:flutter/material.dart';
import 'package:grocery/features/home/presentation/widgets/NavgationViewBody.dart';

class NavgationView extends StatelessWidget {
  const NavgationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NavgationViewBody(),
    );
  }
}
