import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class IconFav extends StatelessWidget {
  const IconFav({super.key, required this.onFavTap});
  final VoidCallback onFavTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFavTap,
      child: const Icon(
        IconlyLight.heart,
        size: 22,
      ),
    );
  }
}
