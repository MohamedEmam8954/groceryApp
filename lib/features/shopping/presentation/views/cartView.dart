import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/shopping/presentation/widgets/cartViewBody.dart';
import 'package:iconly/iconly.dart';

class Cartview extends StatelessWidget {
  const Cartview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart(2)",
          style: AppStyles.style24,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.delete),
          ),
        ],
      ),
      body: const CartViewBody(),
    );
  }
}
