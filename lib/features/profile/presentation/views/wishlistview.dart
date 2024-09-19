import 'package:flutter/material.dart';
import 'package:grocery/core/widgets/customAppBar.dart';
import 'package:grocery/features/profile/presentation/widgets/wishListViewBody.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WishListViewBody(),
      ),
    );
  }
}
