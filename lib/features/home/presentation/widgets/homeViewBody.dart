import 'package:flutter/material.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/sections/cardSwapperSection.dart';
import 'package:grocery/features/home/presentation/sections/onsale_section.dart';
import 'package:grocery/features/home/presentation/sections/our_product_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.productModel});
  final List<ProductModel> productModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          //! Card swapper section
          const CardSwapperSection(),
          //! on sale section
          const OnSaleSection(),
          //! our product section
          OurProductSection(
            productModel: productModel,
          ),
        ],
      ),
    );
  }
}
