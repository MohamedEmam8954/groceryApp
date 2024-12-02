import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grocery/app/darkThemecubit/dark_theme_cubit.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/warningdialog.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/wishlistcubit/wish_list_cubit.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/wishlistcubit/wish_list_cubit_state.dart';
import 'package:iconly/iconly.dart';

class IconFav extends StatefulWidget {
  const IconFav({super.key, required this.productId});
  final String productId;

  @override
  State<IconFav> createState() => _IconFavState();
}

class _IconFavState extends State<IconFav> {
  @override
  void initState() {
    var user = FirebaseAuth.instance.currentUser;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (user != null) {
        context
            .read<WishListCubit>()
            .addOrRemoveWishList(productId: widget.productId);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appMode = context.read<DarkThemeCubit>().currentTextColor;
    return BlocBuilder<WishListCubit, WishListCubitState>(
      builder: (context, state) {
        var wishList = context.read<WishListCubit>();
        bool isFav = wishList.getWishList.containsKey(widget.productId);
        return GestureDetector(
          onTap: () async {
            User? user = FirebaseAuth.instance.currentUser;
            if (user == null) {
              GlobalMethod.errorDialog(context,
                  subTitle: AppStrings.noUserFound);
              return;
            }

            if (!isFav) {
              await wishList.addproductToWishListOnline(widget.productId);
              wishList.addOrRemoveWishList(productId: widget.productId);
            } else {
              await wishList.removeWishListItem(productid: widget.productId);
            }
          },
          child: state is LoadingWishList && widget.productId == state.productid
              ? SpinKitFadingCube(
                  color: appMode,
                  size: 15,
                )
              : Icon(
                  isFav ? IconlyBold.heart : IconlyLight.heart,
                  size: 22,
                  color: isFav ? Colors.red : null,
                ),
        );
      },
    );
  }
}
