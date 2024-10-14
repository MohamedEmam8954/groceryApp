import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/widgets/incartBtn.dart';
import 'price_per_widget.dart';

class TotalPriceInCart extends StatelessWidget {
  const TotalPriceInCart(
      {super.key,
      required this.price,
      required this.ontap,
      required this.numberOfKg,
      required this.productModel,
      required this.controller});
  final double price;
  final VoidCallback ontap;
  final int numberOfKg;
  final ProductModel productModel;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.07),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.total,
                      style: AppStyles.style22.copyWith(
                        color: const Color(0xffe57676),
                      ),
                    ),
                    PricePerKgText(
                      price: price,
                      kg: "$numberOfKg ${productModel.isPiece ? AppStrings.piece : AppStrings.kg}",
                    ),
                  ],
                ),
                IncartBtn(
                  productModel: productModel,
                  controller: controller,
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
