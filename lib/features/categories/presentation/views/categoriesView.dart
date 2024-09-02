import 'package:flutter/material.dart';
import 'package:grocery/features/categories/presentation/widgets/categoriesViewbody.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CategoriesViewBody(),
    );
  }
}
