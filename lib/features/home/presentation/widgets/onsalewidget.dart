import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/utils/warningdialog.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/widgets/pricewidgets.dart';
import 'package:grocery/features/home/presentation/widgets/shoppingandFavIcon.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';

class OnSaleWidget extends StatelessWidget {
  const OnSaleWidget({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cart = context.read<CartCubit>();

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        // navTo(context, AppRouter.productDetails, extra: productModel);
        GoRouter.of(context)
            .push(AppRouter.productDetails, extra: productModel);
      },
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FancyShimmerImage(
                      width: size.width * 0.19,
                      height: size.width * 0.19,
                      imageUrl: productModel.imgUrl,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        productModel.isPiece == 0
                            ? AppStrings.piece
                            : "1 ${AppStrings.kg}",
                        style: AppStyles.style16
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      ShoppingAndFavouriteIcon(
                        onBagTap: () async {
                          User? user = FirebaseAuth.instance.currentUser;
                          if (user == null) {
                            GlobalMethod.errorDialog(context,
                                subTitle: AppStrings.noUserFound);
                            return;
                          }
                          // cart.addProductToCart(
                          //   productmodel: productModel,
                          //   productId: productModel.id,
                          //   quantity: 1,
                          // );
                          await cart.uploadDataCartTofirebase(
                              quantity: '1', productid: productModel.id);
                          await cart.fetchDatafromCart();
                        },
                        id: productModel.id,
                      ),
                    ],
                  ),
                ],
              ),
              FittedBox(
                child: PriceWidget(
                  onsale: productModel.isOnsale,
                  price: double.parse(productModel.price),
                  onsaleprice: productModel.salePrice,
                  textPrice: '1',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                productModel.title,
                style: AppStyles.style18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
