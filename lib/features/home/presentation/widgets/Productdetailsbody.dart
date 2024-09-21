import 'package:flutter/cupertino.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/widgets/add_or_minus_Product.dart';
import 'package:grocery/core/widgets/backwidget.dart';
import 'package:grocery/features/home/presentation/widgets/showProductData.dart';
import 'package:grocery/features/home/presentation/widgets/totalPriceIncart.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

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
            Assets.assetsImagesCatVeg,
            fit: BoxFit.fill,
          ),
        ),
        ShowProductData(
            nameOfProduct: "Banana",
            productPrice: "0.99",
            onFavTap: () {},
            freeDeliveryVisible: true),
        const SizedBox(
          height: 25,
        ),
        const AddOrMinusProduct(
          txtFieldSize: 80,
          addIcon: CupertinoIcons.plus_square,
          minusIcon: CupertinoIcons.minus_square,
        ),
        const Expanded(
          child: SizedBox(
            height: 100,
          ),
        ),
        TotalPriceInCart(price: "0.89", ontap: () {}),
      ],
    );
  }
}
