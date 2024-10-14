import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/groceryproductwidget.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> product =
        context.read<AllProductDetailsCubit>().productModel;
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: EdgeInsets.zero,
      mainAxisSpacing: 10,
      crossAxisSpacing: 15,
      childAspectRatio: 35 / 50,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        product.length < 4 ? product.length : 4,
        (index) {
          return GroceryProductHome(
            productModel: product[index],
          );
        },
      ),
    );
  }
}
