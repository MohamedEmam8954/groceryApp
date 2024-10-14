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
          child: Image.asset(
            productModel.imgUrl,
            fit: BoxFit.fill,
          ),
        ),
        ShowProductData(
            productModel: productModel,
            onFavTap: () {},
            freeDeliveryVisible: true),
      ],
    );
  }
}
