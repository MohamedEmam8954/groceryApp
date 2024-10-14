import 'package:flutter/cupertino.dart';
import 'package:grocery/features/categories/data/model/categoryViewItemmodel.dart';
import 'package:grocery/features/categories/presentation/widgets/custom_categories_view_item.dart';

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
            categoryViewItemModel: categoriesdata[index],
          );
        },
      ),
    );
  }
}
