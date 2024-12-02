import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grocery/app/darkThemecubit/dark_theme_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cartcubitstate.dart';
import 'package:iconly/iconly.dart';

class IconBag extends StatelessWidget {
  const IconBag({
    super.key,
    required this.onBagTap,
    required this.id,
  });
  final VoidCallback onBagTap;
  final String id;

  @override
  Widget build(BuildContext context) {
    var appMode = context.read<DarkThemeCubit>().currentTextColor;
    return BlocBuilder<CartCubit, Cartstate>(
      builder: (context, state) {
        bool isInCart = context.read<CartCubit>().cartItem.containsKey(id);
        bool isLoading =
            state is LoadingToAddProductToCart && state.productId == id;
        return GestureDetector(
          onTap: isInCart ? null : onBagTap,
          child: isLoading
              ? SpinKitFadingCube(
                  color: appMode,
                  size: 10,
                )
              : Icon(
                  isInCart ? IconlyBold.bag_2 : IconlyLight.bag_2,
                  size: 22,
                  color: isInCart ? Colors.green : null,
                ),
        );
      },
    );
  }
}
