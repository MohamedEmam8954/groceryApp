import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/app/darkThemecubit/dark_theme_cubit.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/profile/data/models/order_model.dart';
import 'package:intl/intl.dart';

class YourOrderItem extends StatelessWidget {
  const YourOrderItem({super.key, required this.orderModel});

  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var color = context.read<DarkThemeCubit>().currentTextColor;
    return GestureDetector(
      onTap: () {
        ProductModel productModel = context
            .read<AllProductDetailsCubit>()
            .findByIdFun(productId: orderModel.productId);
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
                  imageUrl: orderModel.imgUrl,
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    "${orderModel.title} x${orderModel.quauntity}",
                    style: AppStyles.style20,
                  ),
                  Text(
                    "Paid:\$${orderModel.price} ",
                    style: AppStyles.style16.copyWith(
                        color: color.withOpacity(0.3),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                DateFormat('yyyy/MM/dd').format(orderModel.orderDate.toDate()),
                style: AppStyles.style18.copyWith(
                    color: color.withOpacity(0.59),
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
            color: color.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
