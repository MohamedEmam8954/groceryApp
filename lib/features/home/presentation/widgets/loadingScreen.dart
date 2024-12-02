import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';

import 'package:grocery/core/widgets/loading_widget.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late String img;
  @override
  void initState() {
    img = landing[Random().nextInt(landing.length)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            img,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          const LoadingWidget(),
        ],
      ),
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
