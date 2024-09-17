import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/features/shopping/presentation/widgets/cartListView.dart';
import 'package:grocery/features/shopping/presentation/widgets/customCartOrder.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CustomCartOrder(),
          SizedBox(
            height: 30,
          ),
          Expanded(child: CartListView()),
        ],
      ),
    );
  }
}
