import 'package:flutter/material.dart';
import 'package:grocery/features/shopping/data/models/cart_model.dart';
import 'package:grocery/features/shopping/presentation/widgets/cart_body_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.cartList});
  final List<CartModel> cartList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartList.length,
      padding: const EdgeInsets.all(6),
      itemBuilder: (context, index) {
        return CartBodyItem(
          cartModel: cartList[index],
        );
      },
    );
  }
}
