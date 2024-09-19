import 'package:flutter/material.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:iconly/iconly.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.canPop(context) ? popAppRouter(context) : null;
      },
      icon: const Icon(IconlyLight.arrow_left_2),
    );
  }
}
