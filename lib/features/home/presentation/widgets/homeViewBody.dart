import 'package:flutter/material.dart';
import 'package:grocery/features/home/presentation/sections/cardSwapperSection.dart';
import 'package:grocery/features/home/presentation/sections/onsale_section.dart';
import 'package:grocery/features/home/presentation/sections/our_product_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          //! Card swapper section
          CardSwapperSection(),
          //! on sale section
          OnSaleSection(),
          //! our product section
          OurProductSection(),
        ],
      ),
    );
  }
}
