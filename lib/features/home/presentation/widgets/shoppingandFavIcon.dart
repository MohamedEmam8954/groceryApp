import 'package:flutter/material.dart';
import 'package:grocery/features/home/presentation/widgets/iconFav.dart';
import 'package:iconly/iconly.dart';

class ShoppingAndFavouriteIcon extends StatelessWidget {
  const ShoppingAndFavouriteIcon(
      {super.key, required this.onShoppingTap, required this.onFavouriteTap});
  final VoidCallback onShoppingTap, onFavouriteTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onShoppingTap,
          child: const Icon(
            IconlyLight.bag_2,
            size: 22,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        IconFav(onFavTap: onFavouriteTap),
      ],
    );
  }
}
