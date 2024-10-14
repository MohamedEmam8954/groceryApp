import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/onsalewidget.dart';

class ProductsOnSaleGridView extends StatelessWidget {
  const ProductsOnSaleGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> productOnSale =
        context.read<AllProductDetailsCubit>().productOnSale;
    return Expanded(
      child: GridView.builder(
        itemCount: productOnSale.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 6,
            childAspectRatio: 165 / 150),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: OnSaleWidget(
              productModel: productOnSale[index],
            ),
          );
        },
      ),
    );
  }
}
