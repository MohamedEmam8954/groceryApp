import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/core/widgets/iconFav.dart';
import 'package:grocery/core/widgets/product_textfield.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/widgets/price_per_widget.dart';
import 'package:grocery/features/home/presentation/widgets/totalPriceIncart.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';

class ShowProductData extends StatefulWidget {
  const ShowProductData({
    super.key,
    required this.onFavTap,
    required this.freeDeliveryVisible,
    required this.productModel,
  });

  final VoidCallback onFavTap;
  final bool freeDeliveryVisible;
  final ProductModel productModel;

  @override
  State<ShowProductData> createState() => _ShowProductDataState();
}

class _ShowProductDataState extends State<ShowProductData> {
  TextEditingController controller = TextEditingController(text: '1');
  int addProduct = 1;
  late double totalprice;

  @override
  void initState() {
    log("the product model id ${widget.productModel.id}");
    totalprice = widget.productModel.price * addProduct;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateTotalPrice() {
    setState(() {
      totalprice = widget.productModel.price * addProduct;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cart = context.read<CartCubit>();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.productModel.title,
                      style: AppStyles.style22
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    IconFav(onFavTap: widget.onFavTap)
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        PricePerKgText(
                          price: widget.productModel.price,
                          color: Colors.green,
                          kg: widget.productModel.isPiece
                              ? AppStrings.piece
                              : AppStrings.kg,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Visibility(
                          visible: widget.productModel.isOnsale,
                          child: Text(
                            "\$${(widget.productModel.salePrice).toStringAsFixed(2)}",
                            style: AppStyles.style15.copyWith(
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: widget.freeDeliveryVisible,
                      child: CustomBtn(
                        radius: 10,
                        ontap: () {},
                        title: AppStrings.freeDelivery,
                        padding: 7,
                        color: const Color(0xff62d281),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
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
                      setState(() {
                        addProduct--;
                        controller.text = addProduct.toString();
                        log("add product -- $addProduct");
                        updateTotalPrice(); // Update total price
                      });
                    }
                  },
                  icon: CupertinoIcons.minus_square,
                  width: 35,
                  hight: 35,
                ),
              ),
              SizedBox(
                width: 80,
                child: ProductTextField(
                  controller: controller,
                  onchanged: (value) {
                    if (value.isEmpty) {
                      controller.text = '1';
                    }
                    setState(() {
                      addProduct = int.parse(controller.text);
                      log(addProduct.toString());
                      updateTotalPrice();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomBtn(
                  radius: 10,
                  ontap: () {
                    setState(() {
                      addProduct++;
                      log("add product ++ $addProduct");
                      controller.text = addProduct.toString();
                      updateTotalPrice();
                      // Update total price
                    });
                  },
                  icon: CupertinoIcons.plus_square,
                  width: 35,
                  hight: 35,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          TotalPriceInCart(
            controller: controller,
            numberOfKg: addProduct,
            price: double.parse(totalprice.toStringAsFixed(2)),
            ontap: () {
              log("product details ${controller.text}");
              cart.addProductToCart(
                productmodel: widget.productModel,
                productId: widget.productModel.id,
                quantity: int.parse(controller.text),
              );
            },
            productModel: widget.productModel,
          ), // Use updated total price
        ],
      ),
    );
  }
}
