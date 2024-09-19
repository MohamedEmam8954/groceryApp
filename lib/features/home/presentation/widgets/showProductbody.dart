import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/widgets/add_or_minus_Product.dart';
import 'package:grocery/features/home/presentation/widgets/showProductData.dart';
import 'package:grocery/features/home/presentation/widgets/totalPriceIncart.dart';
import 'package:iconly/iconly.dart';

class ShowProductBody extends StatelessWidget {
  const ShowProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            popAppRouter(context);
          },
          icon: const Icon(IconlyLight.arrow_left_2),
        ),
        AspectRatio(
          aspectRatio: 2.5 / 1.6,
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
          addIcon: CupertinoIcons.add,
          minusIcon: CupertinoIcons.minus,
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
