import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/bagicon.dart';
import 'package:grocery/core/widgets/iconFav.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/darkThemecubit/dark_theme_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Color color = context.read<DarkThemeCubit>().color();
    var cart = context.read<CartCubit>();
    return GestureDetector(
      onTap: () {
        // navTo(context, AppRouter.productDetails,e);
        GoRouter.of(context)
            .push(AppRouter.productDetails, extra: productModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          height: size.height * 0.20,
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 1),
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width * 0.18,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          productModel.imgUrl,
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconBag(
                          onBagTap: () {
                            cart.addProductToCart(
                              productmodel: productModel,
                              productId: productModel.id,
                              quantity: 1,
                            );
                          },
                          id: productModel.id,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        //! add iconFav()
                        IconFav(
                          productId: productModel.id,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      productModel.title,
                      style: AppStyles.style22,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$0.99",
                      style: AppStyles.style22,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
