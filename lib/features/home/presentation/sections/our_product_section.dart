import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/features/home/presentation/widgets/productGridView.dart';

class OurProductSection extends StatelessWidget {
  const OurProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.ourProduct,
                style: AppStyles.style22.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // navTo(context, AppRouter.browseAllProduct);
                  GoRouter.of(context).push(AppRouter.browseAllProduct);
                },
                child: Text(
                  AppStrings.browseAll,
                  style: AppStyles.style20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const ProductGridView(),
        ],
      ),
    );
  }
}
