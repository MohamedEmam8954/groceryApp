import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/utils/warningdialog.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/app/darkThemecubit/dark_theme_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cartcubitstate.dart';

class HistoryViewItem extends StatelessWidget {
  const HistoryViewItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var color = context.read<DarkThemeCubit>().currentTextColor;

    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.productDetails, extra: productModel);
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width * 0.2,
                height: size.width * 0.23,
                child: FancyShimmerImage(
                  imageUrl: productModel.imgUrl,
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    productModel.title,
                    style: AppStyles.style20,
                  ),
                  Text(
                    "Paid:\$12.8 ",
                    style: AppStyles.style16.copyWith(
                        color: color.withOpacity(0.3),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: BlocBuilder<CartCubit, Cartstate>(
                  builder: (context, state) {
                    var cart = context.read<CartCubit>();
                    var isinCart = cart.cartItem.containsKey(productModel.id);
                    return CustomBtn(
                      radius: 10,
                      color: Colors.green,
                      ontap: isinCart
                          ? null
                          : () async {
                              User? user = FirebaseAuth.instance.currentUser;
                              if (user == null) {
                                GlobalMethod.errorDialog(context,
                                    subTitle: AppStrings.noUserFound);
                                return;
                              }
                              // cart.addProductToCart(
                              //     productId: productModel.id,
                              //     quantity: 1,
                              //     productmodel: productModel);
                              await cart.uploadDataCartTofirebase(
                                  quantity: '1', productid: productModel.id);
                              await cart.fetchDatafromCart();
                            },
                      icon: isinCart ? Icons.check : CupertinoIcons.plus,
                      width: 35,
                      hight: 35,
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
