import 'package:flutter/material.dart';
import 'package:grocery/features/home/presentation/widgets/Productdetailsbody.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ProductDetailsBody(),
      ),
    );
  }
}
