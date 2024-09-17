import 'package:flutter/material.dart';
import 'package:grocery/features/home/presentation/widgets/noProductSale.dart';
import 'package:grocery/features/home/presentation/widgets/productsOnSaleGridView.dart';

class OnSaleViewBody extends StatelessWidget {
  const OnSaleViewBody({
    super.key,
    required this.isSale,
  });

  final bool isSale;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isSale ? const NoProductSale() : const ProductsOnSaleGridView(),
      ],
    );
  }
}
