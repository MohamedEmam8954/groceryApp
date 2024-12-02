import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grocery/app/darkThemecubit/dark_theme_cubit.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/utils/warningdialog.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cartcubitstate.dart';

class IncartBtn extends StatelessWidget {
  const IncartBtn({
    super.key,
    required this.controller,
    required this.productModel,
    required this.color,
    required this.borderRadius,
    this.width,
    required this.textColor,
  });

  final TextEditingController controller;
  final ProductModel productModel;
  final Color color, textColor;
  final double? width;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    var appMode = context.read<DarkThemeCubit>().currentTextColor;
    return BlocBuilder<CartCubit, Cartstate>(
      builder: (context, state) {
        var cart = context.read<CartCubit>();
        bool isInCart = cart.cartItem.containsKey(productModel.id);

        bool isLoading = state is LoadingToAddProductToCart &&
            state.productId == productModel.id;

        return InkWell(
          onTap: isInCart || isLoading
              ? null
              : () {
                  User? user = FirebaseAuth.instance.currentUser;
                  if (user == null) {
                    GlobalMethod.errorDialog(
                      context,
                      subTitle: AppStrings.noUserFound,
                    );
                    return;
                  }

                  cart.uploadDataCartTofirebase(
                    quantity: controller.text,
                    productid: productModel.id,
                  );
                },
          child: Container(
            padding: const EdgeInsets.all(9),
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: color, borderRadius: borderRadius),
            child: isLoading
                ? SpinKitFadingCube(
                    color: appMode,
                    size: 20,
                  )
                : Text(
                    isInCart ? AppStrings.inCart : AppStrings.addToCart,
                    style: AppStyles.style18.copyWith(color: textColor),
                  ),
          ),
        );
      },
    );
  }
}
