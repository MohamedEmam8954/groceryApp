import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/function/warningdialog.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/views/emptyViewBody.dart';
import 'package:grocery/core/widgets/totalcartappbar.dart';
import 'package:grocery/features/profile/data/models/wish_list_model.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/wishlistcubit/wish_list_cubit.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/wishlistcubit/wish_list_cubit_state.dart';
import 'package:grocery/features/profile/presentation/widgets/wishListViewBody.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListCubitState>(
      builder: (context, state) {
        var wishList = context.read<WishListCubit>();
        List<WishListModel> wishListItems =
            wishList.getWishList.values.toList().reversed.toList();
        if (wishListItems.isEmpty) {
          return const EmptyView(
            image: Assets.assetsImagesWishlist,
            title: AppStrings.yourwishlistempty,
            subtitle: AppStrings.exploremoreandshortlistsomeitems,
            btnTitle: AppStrings.wishList,
          );
        }
        return SafeArea(
          child: Scaffold(
            appBar: TotalCartAppBar(
              isback: true,
              centertitle: true,
              title: AppStrings.wishList,
              numberofProduct: wishListItems.length.toString(),
              deleteOnTap: () {
                GlobalMethod.warningDialog(
                  context,
                  title: AppStrings.emptyWishlist,
                  subTitle: AppStrings.areYouSure,
                  onTapOK: () {
                    wishList.deleteAllWishList();
                    popAppRouter(context);
                  },
                );
              },
            ),
            body: WishListViewBody(
              wishList: wishListItems,
            ),
          ),
        );
      },
    );
  }
}
