import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/customAppBar.dart';
import 'package:grocery/features/home/presentation/widgets/onSaleViewBody.dart';

class OnSaleView extends StatelessWidget {
  const OnSaleView({super.key, this.isSale = true});
  final bool isSale;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.productsOnSale,
        action: false,
      ),
      body: OnSaleViewBody(isSale: isSale),
    );
  }
}
