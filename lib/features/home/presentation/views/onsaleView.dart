import 'package:flutter/material.dart';
import 'package:grocery/core/function/navigationApp.dart';

import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/home/presentation/widgets/noProductSale.dart';

import 'package:grocery/features/home/presentation/widgets/productsOnSaleGridView.dart';
import 'package:iconly/iconly.dart';

class OnSaleView extends StatelessWidget {
  const OnSaleView({super.key, this.isSale = true});
  final bool isSale;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            popAppRouter(context);
          },
          child: const Icon(IconlyLight.arrow_left_2),
        ),
        title: Text(
          AppStrings.productsOnSale,
          style: AppStyles.style24.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          isSale ? const NoProductSale() : const ProductsOnSaleGridView(),
        ],
      ),
    );
  }
}
