import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/features/categories/data/model/categoryViewItemmodel.dart';
import 'package:grocery/features/categories/presentation/widgets/custom_categories_View_item.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: CategoriesGridView(),
    );
  }
}

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 260 / 250,
      children: List.generate(
        6,
        (index) {
          return CustomCategoryViewItem(
            ontap: () {},
            categoryViewItemModel: categoriesdata[index],
          );
        },
      ),
    );
  }
}
