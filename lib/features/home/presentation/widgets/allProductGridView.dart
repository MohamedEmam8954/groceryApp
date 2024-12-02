import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/widgets/groceryproductwidget.dart';

class AllProductGridView extends StatelessWidget {
  const AllProductGridView({super.key, required this.productModel});
  final List<ProductModel> productModel;
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
        productModel.length,
        (index) {
          return InkWell(
            onTap: () {
              // navTo(context, AppRouter.productDetails, extra: product[index]);
              GoRouter.of(context)
                  .push(AppRouter.productDetails, extra: productModel[index]);
            },
            child: GroceryProductHome(
              productModel: productModel[index],
            ),
          );
        },
      ),
    );
  }
}
