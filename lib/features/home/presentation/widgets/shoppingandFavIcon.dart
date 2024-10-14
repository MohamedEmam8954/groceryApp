import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/widgets/iconFav.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cartcubitstate.dart';
import 'package:iconly/iconly.dart';

class ShoppingAndFavouriteIcon extends StatelessWidget {
  const ShoppingAndFavouriteIcon(
      {super.key,
      required this.onShoppingTap,
      required this.onFavouriteTap,
      required this.id});
  final VoidCallback onShoppingTap, onFavouriteTap;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<CartCubit, Cartcubitstate>(
          builder: (context, state) {
            bool isInCart = context.read<CartCubit>().cartItem.containsKey(id);
            return GestureDetector(
              onTap: isInCart ? null : onShoppingTap,
              child: Icon(
                isInCart ? IconlyBold.bag_2 : IconlyLight.bag_2,
                size: 22,
                color: isInCart ? Colors.green : null,
              ),
            );
          },
        ),
        const SizedBox(
          width: 5,
        ),
        IconFav(onFavTap: onFavouriteTap),
      ],
    );
  }
}
