import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/home/presentation/widgets/Cardswaper.dart';

import 'package:grocery/features/home/presentation/widgets/onSaleRotated.dart';
import 'package:grocery/features/home/presentation/widgets/onsalelistView.dart';
import 'package:grocery/features/home/presentation/widgets/productGridView.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.33,
            child: const CardSwaper(),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.viewAll,
              style: AppStyles.style20,
            ),
          ),
          const Row(
            children: [
              OnSaleRotated(),
              SizedBox(
                width: 8,
              ),
              Expanded(child: OnsaleListView()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.ourProduct,
                      style: AppStyles.style22
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.browseAll,
                        style: AppStyles.style20,
                      ),
                    ),
                  ],
                ),
                const ProductGridView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
