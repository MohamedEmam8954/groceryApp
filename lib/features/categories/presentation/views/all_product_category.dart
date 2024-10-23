import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/custom_appbar.dart';
import 'package:grocery/features/categories/data/model/categoryViewItemmodel.dart';
import 'package:grocery/features/categories/presentation/widgets/all_product_category_body.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';

class AllProductCategory extends StatelessWidget {
  const AllProductCategory({super.key, required this.categoryViewItemModel});
  final CategoryViewItemModel categoryViewItemModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: AppStrings.allProducts),
        body: BlocProvider(
          create: (context) => AllProductDetailsCubit(),
          child: AllProductCategoryBody(
            categoryViewItemModel: categoryViewItemModel,
          ),
        ),
      ),
    );
  }
}
