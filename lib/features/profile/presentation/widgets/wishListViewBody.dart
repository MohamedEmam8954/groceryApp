import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/profile/data/models/wish_list_model.dart';

import 'package:grocery/features/profile/presentation/widgets/wish_list_item.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key, required this.wishList});
  final List<WishListModel> wishList;

  @override
  Widget build(BuildContext context) {
    var productModel = context.read<AllProductDetailsCubit>();
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: wishList.length,
      itemBuilder: (context, index) {
        return WishlistItem(
          productModel:
              productModel.findByIdFun(productId: wishList[index].productId),
        );
      },
    );
  }
}
