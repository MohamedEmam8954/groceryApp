import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/home/presentation/widgets/pricewidgets.dart';
import 'package:grocery/features/home/presentation/widgets/shoppingandFavIcon.dart';

class OnSaleWidget extends StatelessWidget {
  const OnSaleWidget({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    width: size.width * 0.23,
                    height: size.width * 0.23,
                    Assets.assetsImagesCatNuts,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "1 ${AppStrings.kg}",
                        style: AppStyles.style22
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      ShoppingAndFavouriteIcon(
                        onFavouriteTap: () {},
                        onShoppingTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const FittedBox(
                child: PriceWidget(
                  onsale: true,
                  price: 3.66,
                  onsaleprice: 2.5,
                  textPrice: "1",
                ),
              ),
              Text(
                "Product",
                style: AppStyles.style16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
