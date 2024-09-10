import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';

class CardSwaper extends StatelessWidget {
  const CardSwaper({super.key});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          offers[index],
          fit: BoxFit.fill,
        );
      },
      itemCount: offers.length,
      pagination: const SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: DotSwiperPaginationBuilder(
            activeColor: Colors.red, color: Colors.white),
      ),
      autoplay: true,
    );
  }

  final List<String> offers = const [
    Assets.assetsImagesOffresOffer1,
    Assets.assetsImagesOffresOffer2,
    Assets.assetsImagesOffresOffer3,
    Assets.assetsImagesOffresOffer4,
  ];
}
