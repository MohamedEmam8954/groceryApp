import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cartcubitstate.dart';

class IncartBtn extends StatelessWidget {
  const IncartBtn(
      {super.key,
      required this.controller,
      required this.productModel,
      required this.color,
      required this.borderRadius,
      this.width});

  final TextEditingController controller;
  final ProductModel productModel;
  final Color color;
  final double? width;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    var cart = context.read<CartCubit>();

    return BlocBuilder<CartCubit, Cartcubitstate>(
      builder: (context, state) {
        bool isInCart =
            context.read<CartCubit>().cartItem.containsKey(productModel.id);
        return InkWell(
          onTap: isInCart
              ? null
              : () {
                  {
                    cart.addProductToCart(
                      productmodel: productModel,
                      productId: productModel.id,
                      quantity: int.parse(controller.text),
                    );
                  }
                },
          child: Container(
            padding: const EdgeInsets.all(9),
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: color, borderRadius: borderRadius),
            child: Text(
              isInCart ? AppStrings.inCart : AppStrings.addToCart,
              style: AppStyles.style18,
            ),
          ),
        );
      },
    );
  }
}
