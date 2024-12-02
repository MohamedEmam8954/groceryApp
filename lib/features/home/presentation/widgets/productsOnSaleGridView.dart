import 'package:flutter/material.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/widgets/onsalewidget.dart';

class ProductsOnSaleGridView extends StatelessWidget {
  const ProductsOnSaleGridView({super.key, required this.sale});
  final List<ProductModel> sale;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: sale.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 6,
            childAspectRatio: 122 / 120),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: OnSaleWidget(
              productModel: sale[index],
            ),
          );
        },
      ),
    );
  }
}
