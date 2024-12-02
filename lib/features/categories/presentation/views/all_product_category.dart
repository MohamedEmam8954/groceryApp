import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/custom_appbar.dart';
import 'package:grocery/features/categories/data/model/categoryViewItemmodel.dart';
import 'package:grocery/features/categories/presentation/widgets/all_product_category_body.dart';

class AllProductCategory extends StatelessWidget {
  const AllProductCategory({super.key, required this.categoryViewItemModel});
  final CategoryViewItemModel categoryViewItemModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: AppStrings.allProducts),
        body: AllProductCategoryBody(
          categoryViewItemModel: categoryViewItemModel,
        ),
      ),
    );
  }
}
