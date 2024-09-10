import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/categories/presentation/widgets/categoriesViewbody.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.category,
            style: AppStyles.style20,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: const CategoriesViewBody(),
      ),
    );
  }
}
