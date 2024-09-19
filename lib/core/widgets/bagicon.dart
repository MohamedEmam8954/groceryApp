import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class IconBag extends StatelessWidget {
  const IconBag({super.key, required this.onBagTap});
  final VoidCallback onBagTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBagTap,
      child: const Icon(
        IconlyLight.bag_2,
        size: 22,
      ),
    );
  }
}
