import 'dart:developer';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/app/darkThemecubit/dark_theme_cubit.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/core/widgets/iconFav.dart';
import 'package:grocery/core/widgets/product_textfield.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/shopping/data/models/cart_model.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cartcubitstate.dart';

class CartBodyItem extends StatefulWidget {
  const CartBodyItem({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  State<CartBodyItem> createState() => _CartBodyItemState();
}

class _CartBodyItemState extends State<CartBodyItem> {
  TextEditingController controller = TextEditingController(text: '1');
  num addProduct = 1;
  late ProductModel currentProduct;
  late num sale;
  bool isLoading = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    currentProduct = context
        .read<AllProductDetailsCubit>()
        .findByIdFun(productId: widget.cartModel.productId);

    controller.text = widget.cartModel.quantity.toString();
    addProduct = double.parse(controller.text);
    sale = currentProduct.isOnsale
        ? currentProduct.salePrice
        : double.parse(currentProduct.price);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cartCubit = context.read<CartCubit>();
    var appMode = context.read<DarkThemeCubit>().currentTextColor;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.height * 0.01,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          GoRouter.of(context)
              .push(AppRouter.productDetails, extra: currentProduct);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Container(
                    width: size.width * 0.25,
                    height: size.width * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: FancyShimmerImage(
                      boxFit: BoxFit.fill,
                      imageUrl: currentProduct.imgUrl,
                    ),
                  ),
                  // Product Details
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.02,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentProduct.title,
                            style: AppStyles.style22
                                .copyWith(fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            children: [
                              // Decrease Quantity Button
                              CustomBtn(
                                radius: 10,
                                color: Colors.red,
                                ontap: () {
                                  if (addProduct > 1) {
                                    addProduct--;
                                    controller.text = addProduct.toString();
                                    cartCubit.decreaseQuantityByOne(
                                      productId: widget.cartModel.productId,
                                    );
                                    log("Decreased quantity: $addProduct");
                                    setState(() {});
                                  }
                                },
                                icon: CupertinoIcons.minus_square,
                                width: size.width * 0.08,
                                hight: size.width * 0.08,
                              ),
                              SizedBox(width: size.width * 0.02),
                              // Quantity TextField
                              SizedBox(
                                width: size.width * 0.1,
                                child: ProductTextField(
                                  controller: controller,
                                  onchanged: (value) {
                                    if (value.isEmpty ||
                                        int.tryParse(value) == null) {
                                      controller.text = '1';
                                    }
                                    addProduct = double.parse(controller.text);
                                    cartCubit.increaseQuantityByOne(
                                      productId: widget.cartModel.productId,
                                    );
                                    log("Updated quantity: $addProduct");
                                    setState(() {});
                                  },
                                  onSubmitted: (value) {
                                    if (value.isNotEmpty &&
                                        int.tryParse(value) != null) {
                                      addProduct = double.parse(value);
                                      cartCubit.increaseQuantityByOne(
                                        productId: widget.cartModel.productId,
                                      );
                                      log("Submitted quantity: $addProduct");
                                      setState(() {});
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: size.width * 0.02),
                              // Increase Quantity Button
                              CustomBtn(
                                radius: 10,
                                ontap: () {
                                  addProduct++;
                                  controller.text = addProduct.toString();
                                  cartCubit.increaseQuantityByOne(
                                    productId: widget.cartModel.productId,
                                  );
                                  log("Increased quantity: $addProduct");
                                  setState(() {});
                                },
                                icon: CupertinoIcons.plus_square,
                                width: size.width * 0.08,
                                hight: size.width * 0.08,
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01),
                        ],
                      ),
                    ),
                  ),
                  // Cart Actions and Price
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        BlocBuilder<CartCubit, Cartstate>(
                          builder: (context, state) {
                            if (state is LoadingToRemoveCartItem &&
                                state.productId == widget.cartModel.productId) {
                              return SpinKitFadingCube(
                                color: appMode,
                                size: 15,
                              );
                            }
                            return InkWell(
                              onTap: () async {
                                await cartCubit.removeCartItem(
                                    productId: widget.cartModel.productId);
                              },
                              child: Icon(
                                CupertinoIcons.cart_badge_minus,
                                color: Colors.red,
                                size: size.width * 0.05,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                        IconFav(productId: widget.cartModel.productId),
                        SizedBox(height: size.height * 0.02),
                        FittedBox(
                          child: Text(
                            r'$' + (sale * addProduct).toStringAsFixed(2),
                            style: AppStyles.style15,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
