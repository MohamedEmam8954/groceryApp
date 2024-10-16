import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cartcubitstate.dart';
import 'package:iconly/iconly.dart';

class IconBag extends StatelessWidget {
  const IconBag({super.key, required this.onBagTap, required this.id});
  final VoidCallback onBagTap;
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, Cartcubitstate>(
      builder: (context, state) {
        bool isInCart = context.read<CartCubit>().cartItem.containsKey(id);
        return GestureDetector(
          onTap: isInCart ? null : onBagTap,
          child: Icon(
            isInCart ? IconlyBold.bag_2 : IconlyLight.bag_2,
            size: 22,
            color: isInCart ? Colors.green : null,
          ),
        );
      },
    );
  }
}
