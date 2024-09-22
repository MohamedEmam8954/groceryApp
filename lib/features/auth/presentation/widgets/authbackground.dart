import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              landing[index],
              fit: BoxFit.cover,
            );
          },
          itemCount: landing.length,
          autoplay: true,
        ),
        // Positioned.fill(
        //   child: BackdropFilter(
        //     filter: ImageFilter.blur(
        //         sigmaX: 5.0, sigmaY: 5.0), // Adjust blur intensity
        //     child: Container(
        //       color: Colors.black
        //           .withOpacity(0), // Required to show the blur effect
        //     ),
        //   ),
        // ),
      ],
    );
  }

  final List<String> landing = const [
    Assets.assetsImagesLandingBuyThrough,
    Assets.assetsImagesLandingGroceryCart,
    Assets.assetsImagesLandingStore,
    Assets.assetsImagesLandingVergtablebg,
  ];
}
