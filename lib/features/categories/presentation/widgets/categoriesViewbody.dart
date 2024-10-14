import 'package:flutter/material.dart';

import 'package:grocery/features/categories/presentation/widgets/categories_grid_view.dart';

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
