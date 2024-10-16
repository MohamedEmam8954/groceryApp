import 'package:flutter/material.dart';
import 'package:grocery/features/profile/presentation/widgets/ProfileViewBody.dart';

class Profileview extends StatelessWidget {
  const Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: ProfileViewBody(),
      ),
    );
  }
}
