import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/totalcartappbar.dart';
import 'package:grocery/features/profile/presentation/widgets/wishListViewBody.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TotalCartAppBar(
          isback: true,
          title: AppStrings.wishList,
          numberofProduct: "4",
          deleteOnTap: () {},
        ),
        body: const WishListViewBody(),
      ),
    );
  }
}
