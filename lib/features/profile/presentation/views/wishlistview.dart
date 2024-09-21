import 'package:flutter/material.dart';
import 'package:grocery/core/function/warningdialog.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/views/emptyViewBody.dart';
import 'package:grocery/core/widgets/totalcartappbar.dart';
import 'package:grocery/features/profile/presentation/widgets/wishListViewBody.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isempty = true;
    if (_isempty) {
      return const EmptyView(
        image: Assets.assetsImagesWishlist,
        title: AppStrings.yourwishlistempty,
        subtitle: AppStrings.exploremoreandshortlistsomeitems,
        btnTitle: AppStrings.wishList,
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: TotalCartAppBar(
            isback: true,
            centertitle: true,
            title: AppStrings.wishList,
            numberofProduct: "4",
            deleteOnTap: () {
              GlobalMethod.warningDialog(
                context,
                title: AppStrings.emptyWishlist,
                subTitle: AppStrings.areYouSure,
                onTapOK: () {},
              );
            },
          ),
          body: const WishListViewBody(),
        ),
      );
    }
  }
}
