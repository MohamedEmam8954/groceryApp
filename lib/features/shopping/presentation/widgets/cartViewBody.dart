import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/features/profile/data/repo/orderRepo/order_repo_imp.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/orderCubit/order_cubit.dart';
import 'package:grocery/features/shopping/data/models/cart_model.dart';
import 'package:grocery/features/shopping/presentation/widgets/cartListView.dart';
import 'package:grocery/features/shopping/presentation/widgets/customCartOrder.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.cartList});
  final List<CartModel> cartList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          BlocProvider(
            create: (context) => OrderCubit(getIt.get<OrderRepoImp>()),
            child: CustomCartOrder(
              cartList: cartList,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: CartListView(
            cartList: cartList,
          )),
        ],
      ),
    );
  }
}
