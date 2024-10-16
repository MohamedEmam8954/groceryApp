import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/features/categories/data/model/categoryViewItemmodel.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/groceryproductwidget.dart';

class AllProductCatGridView extends StatelessWidget {
  const AllProductCatGridView({super.key, required this.categoryViewItemModel});
  final CategoryViewItemModel categoryViewItemModel;

  @override
  Widget build(BuildContext context) {
    List<ProductModel> product = context
        .read<AllProductDetailsCubit>()
        .findByCategory(categoryViewItemModel.title);

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: EdgeInsets.zero,
      mainAxisSpacing: 10,
      crossAxisSpacing: 15,
      childAspectRatio: 35 / 50,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        product.length,
        (index) {
          return InkWell(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.productDetails, extra: product[index]);
            },
            child: GroceryProductHome(
              productModel: product[index],
            ),
          );
        },
      ),
    );
  }
}
