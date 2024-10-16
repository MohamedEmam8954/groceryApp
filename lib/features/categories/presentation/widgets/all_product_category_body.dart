import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/features/categories/data/model/categoryViewItemmodel.dart';
import 'package:grocery/features/categories/presentation/widgets/show_all_product.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/noProductSale.dart';

class AllProductCategoryBody extends StatelessWidget {
  const AllProductCategoryBody(
      {super.key, required this.categoryViewItemModel});
  final CategoryViewItemModel categoryViewItemModel;

  @override
  Widget build(BuildContext context) {
    List<ProductModel> product = context
        .read<AllProductDetailsCubit>()
        .findByCategory(categoryViewItemModel.title);
    return SingleChildScrollView(
        child: product.isEmpty
            ? const NoProductYet(title: AppStrings.noProductNow)
            : ShowAllProduct(categoryViewItemModel: categoryViewItemModel));
  }
}
