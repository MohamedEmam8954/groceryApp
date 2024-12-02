import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery/core/widgets/backwidget.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/widgets/showProductData.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: BackWidget(),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FancyShimmerImage(
              boxFit: BoxFit.fill,
              imageUrl: productModel.imgUrl,
            ),
          ),
        ),
        ShowProductData(productModel: productModel, freeDeliveryVisible: true),
      ],
    );
  }
}
