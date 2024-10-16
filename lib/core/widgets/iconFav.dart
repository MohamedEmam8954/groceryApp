import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/wishlistcubit/wish_list_cubit.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/wishlistcubit/wish_list_cubit_state.dart';
import 'package:iconly/iconly.dart';

class IconFav extends StatelessWidget {
  const IconFav({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListCubitState>(
      builder: (context, state) {
        var wishList = context.read<WishListCubit>();
        bool isFav = wishList.getWishList.containsKey(productId);
        return GestureDetector(
          onTap: () {
            wishList.addOrRemoveWishList(productId: productId);
          },
          child: Icon(
            isFav ? IconlyBold.heart : IconlyLight.heart,
            size: 22,
            color: isFav ? Colors.red : null,
          ),
        );
      },
    );
  }
}
