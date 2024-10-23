import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/widgets/product_details_body.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/viewedProductcubit/viewed_product_cubit.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    var viewed = context.read<ViewedProductCubit>();
    return SafeArea(
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          viewed.addProductToHistory(productid: productModel.id);
        },
        child: Scaffold(
          body: ProductDetailsBody(
            productModel: productModel,
          ),
        ),
      ),
    );
  }
}
