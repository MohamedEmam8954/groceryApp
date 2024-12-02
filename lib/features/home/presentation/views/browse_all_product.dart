import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/custom_appbar.dart';
import 'package:grocery/features/home/data/model/product_model.dart';

import 'package:grocery/features/home/presentation/widgets/browseallProductBody.dart';

class BrowseAllProductView extends StatelessWidget {
  const BrowseAllProductView({super.key, required this.productModel});
  final List<ProductModel> productModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: AppStrings.allProducts),
        body: BrowseAllProductBody(
          productModel: productModel,
        ),
      ),
    );
  }
}
