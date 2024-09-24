import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          landing[index],
          fit: BoxFit.cover,
        );
      },
      itemCount: landing.length,
      autoplay: true,
      duration: 800,
      autoplayDelay: 8000,
    );
  }

  final List<String> landing = const [
    Assets.assetsImagesLandingBuyOnLaptop,
    Assets.assetsImagesLandingBuyThrough,
    Assets.assetsImagesLandingBuyfood,
    Assets.assetsImagesLandingGroceryCart,
    Assets.assetsImagesLandingStore,
    Assets.assetsImagesLandingVergtablebg,
  ];
}
