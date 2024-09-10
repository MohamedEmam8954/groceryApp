import 'package:flutter/material.dart';
import 'package:grocery/features/home/presentation/widgets/homeViewBody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
