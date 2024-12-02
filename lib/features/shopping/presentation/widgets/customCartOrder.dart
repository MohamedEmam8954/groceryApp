import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/orderCubit/order_cubit.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/orderCubit/order_cubit_state.dart';
import 'package:grocery/features/shopping/data/models/cart_model.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cartcubitstate.dart';

class CustomCartOrder extends StatelessWidget {
  const CustomCartOrder({super.key, required this.cartList});
  final List<CartModel> cartList;

  @override
  Widget build(BuildContext context) {
    var orderCubit = context.read<OrderCubit>();
    double total = 0.0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocConsumer<OrderCubit, OrderCubitState>(
            listener: (context, state) {
              if (state is SucessOrderCubitState) {
                Fluttertoast.showToast(
                  msg: "you are Make order Now Check It!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  backgroundColor: Colors.blue,
                );
              }
            },
            builder: (context, state) {
              return CustomBtn(
                radius: 10,
                ontap: () async {
                  for (var element in cartList) {
                    ProductModel productModel = context
                        .read<AllProductDetailsCubit>()
                        .findByIdFun(productId: element.productId);
                    await orderCubit.makeOrder(
                      title: productModel.title,
                      productId: element.productId,
                      price: (productModel.isOnsale
                              ? productModel.salePrice
                              : double.parse(productModel.price) *
                                  element.quantity)
                          .toString(),
                      totalPrice: total.toString(),
                      quantity: element.quantity.toString(),
                      imgUrl: productModel.imgUrl,
                    );
                  }
                  await context.read<CartCubit>().deleteAllCartItems();
                },
                title: AppStrings.orderNow,
                isLoading: state is LoadingOrderCubitState ? true : false,
                width: 115,
                hight: 46,
              );
            },
          ),
          Flexible(
            child: BlocBuilder<CartCubit, Cartstate>(
              builder: (context, state) {
                var cartItems = context.read<CartCubit>().cartItem;
                var products = context.read<AllProductDetailsCubit>();
                cartItems.forEach((k, v) {
                  var product = products.findByIdFun(productId: v.productId);
                  total += (product.isOnsale
                          ? product.salePrice
                          : double.parse(product.price)) *
                      v.quantity;
                });
                return FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "${AppStrings.total} \$${total.toStringAsFixed(2)}",
                    style: AppStyles.style20,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
