import 'package:flutter/material.dart';
import 'package:grocery/features/home/presentation/widgets/onsalewidget.dart';

class ProductsOnSaleGridView extends StatelessWidget {
  const ProductsOnSaleGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 6,
            childAspectRatio: 165 / 150),
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(10.0),
            child: OnSaleWidget(),
          );
        },
      ),
    );
  }
}
