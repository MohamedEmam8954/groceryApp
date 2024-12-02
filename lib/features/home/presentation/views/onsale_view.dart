import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/custom_appbar.dart';
import 'package:grocery/features/home/presentation/widgets/onSaleViewBody.dart';

class OnSaleView extends StatelessWidget {
  const OnSaleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.productsOnSale,
        action: false,
      ),
      body: OnSaleViewBody(),
    );
  }
}
