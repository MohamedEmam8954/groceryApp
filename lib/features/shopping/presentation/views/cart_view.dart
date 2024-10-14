import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/function/warningdialog.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/views/emptyViewBody.dart';
import 'package:grocery/core/widgets/totalcartappbar.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cartcubitstate.dart';
import 'package:grocery/features/shopping/presentation/widgets/cartViewBody.dart';

class Cartview extends StatelessWidget {
  const Cartview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, Cartcubitstate>(
      builder: (context, state) {
        var cartCubit = context.read<CartCubit>();
        var cart = cartCubit.cartItem;
        var cartList = cart.values.toList().reversed.toList();
        if (cartList.isEmpty) {
          return const EmptyView(
            image: Assets.assetsImagesCart,
            title: AppStrings.yourCartempty,
            subtitle: AppStrings.addSomethingMakeMeHappy,
            btnTitle: AppStrings.shopNow,
          );
        }
        return Scaffold(
          appBar: TotalCartAppBar(
            title: AppStrings.cart,
            numberofProduct: cartList.length.toString(),
            deleteOnTap: () {
              GlobalMethod.warningDialog(
                context,
                title: AppStrings.emptyCart,
                subTitle: AppStrings.areYouSure,
                onTapOK: () {
                  cartCubit.deleteAllCartItem();
                  popAppRouter(context);
                },
              );
            },
          ),
          body: CartViewBody(
            cartList: cartList,
          ),
        );
      },
    );
  }
}
