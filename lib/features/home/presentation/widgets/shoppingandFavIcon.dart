import 'package:flutter/material.dart';
import 'package:grocery/core/widgets/bagicon.dart';
import 'package:grocery/core/widgets/iconFav.dart';

class ShoppingAndFavouriteIcon extends StatelessWidget {
  const ShoppingAndFavouriteIcon(
      {super.key, required this.onBagTap, required this.id});
  final VoidCallback onBagTap;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ! add here
        IconBag(onBagTap: onBagTap, id: id),
        const SizedBox(
          width: 5,
        ),
        IconFav(
          productId: id,
        ),
      ],
    );
  }
}
