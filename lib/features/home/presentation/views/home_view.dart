import 'package:flutter/material.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/widgets/homeViewBody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.productmodel});
  final List<ProductModel> productmodel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: HomeViewBody(productModel: productmodel)),
    );
  }
}
