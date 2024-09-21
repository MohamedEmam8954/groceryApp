import 'package:flutter/material.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/features/home/presentation/widgets/groceryproductwidget.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: EdgeInsets.zero,
      mainAxisSpacing: 10,
      crossAxisSpacing: 15,
      childAspectRatio: 35 / 50,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        4,
        (index) {
          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              navTo(context, AppRouter.productDetails);
            },
            child: const GroceryProductHome(),
          );
        },
      ),
    );
  }
}
