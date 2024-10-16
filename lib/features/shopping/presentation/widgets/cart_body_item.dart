import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/app_router.dart';

import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/core/widgets/iconFav.dart';
import 'package:grocery/core/widgets/product_textfield.dart';
import 'package:grocery/features/shopping/data/models/cart_model.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';

class CartBodyItem extends StatefulWidget {
  const CartBodyItem({
    super.key,
    required this.cartModel,
  });

  final CartModel cartModel;
  // final ProductModel productModel;

  @override
  State<CartBodyItem> createState() => _CartBodyItemState();
}

class _CartBodyItemState extends State<CartBodyItem> {
  TextEditingController controller = TextEditingController(text: '1');
  int addProduct = 1;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    log(widget.cartModel.quantity.toString());
    controller.text = widget.cartModel.quantity.toString();
    addProduct = int.parse(controller.text);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cartitems = context.read<CartCubit>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          GoRouter.of(context).push(AppRouter.productDetails,
              extra: widget.cartModel.productModel);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.25,
                    height: size.width * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset(
                      widget.cartModel.productModel!.imgUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cartModel.productModel!.title,
                              style: AppStyles.style22
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            //! replace in
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: CustomBtn(
                                    radius: 10,
                                    color: Colors.red,
                                    ontap: () {
                                      if (addProduct > 1) {
                                        addProduct--;
                                        controller.text = addProduct.toString();
                                        cartitems.decreaseQuantityByOne(
                                            productModel:
                                                widget.cartModel.productModel!,
                                            productId:
                                                widget.cartModel.productId);

                                        log("add product -- $addProduct");
                                      }
                                      setState(() {});
                                    },
                                    icon: CupertinoIcons.minus_square,
                                    width: 35,
                                    hight: 35,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                  child: ProductTextField(
                                    controller: controller,
                                    onchanged: (value) {
                                      if (value.isEmpty) {
                                        controller.text = '1';
                                      }
                                      addProduct = int.parse(controller.text);
                                      log(addProduct.toString());
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CustomBtn(
                                    radius: 10,
                                    ontap: () {
                                      if (addProduct >= 1) {
                                        addProduct++;
                                        log("add product ++ $addProduct");
                                        controller.text = addProduct.toString();
                                        cartitems.increaseQuantityByOne(
                                          productModel:
                                              widget.cartModel.productModel!,
                                        );
                                      }
                                      setState(() {});
                                    },
                                    icon: CupertinoIcons.plus_square,
                                    width: 35,
                                    hight: 35,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                cartitems.removeCartItem(
                                    productId: widget.cartModel.productId);
                              },
                              child: const Icon(
                                CupertinoIcons.cart_badge_minus,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            IconFav(
                              productId: widget.cartModel.productId,
                            ),
                            Text(
                              "\$ 33.9",
                              style: AppStyles.style20,
                            ),
                          ],
                        )
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
