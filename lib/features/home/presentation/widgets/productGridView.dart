import 'package:flutter/material.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/widgets/groceryproductwidget.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.productModel});
  final List<ProductModel> productModel;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: EdgeInsets.zero,
      mainAxisSpacing: 10,
      crossAxisSpacing: 15,
      childAspectRatio: 20 / 30,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        productModel.length < 4 ? productModel.length : 4,
        (index) {
          return GroceryProductHome(
            productModel: productModel[index],
          );
        },
      ),
    );
  }
}
