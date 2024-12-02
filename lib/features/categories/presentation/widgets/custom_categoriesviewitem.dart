import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/categories/data/model/categoryViewItemmodel.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';

class CustomCategoryViewItem extends StatelessWidget {
  const CustomCategoryViewItem(
      {super.key, required this.categoryViewItemModel});

  final CategoryViewItemModel categoryViewItemModel;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    context
        .read<AllProductDetailsCubit>()
        .findByCategory(categoryViewItemModel.title);

    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.allProductcategories, extra: categoryViewItemModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryViewItemModel.color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: categoryViewItemModel.color.withOpacity(0.7), width: 2),
        ),
        child: Column(
          children: [
            Container(
              width: width * 0.3,
              height: width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(categoryViewItemModel.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              categoryViewItemModel.title,
              textAlign: TextAlign.center,
              style: AppStyles.style20,
            )
          ],
        ),
      ),
    );
  }
}
