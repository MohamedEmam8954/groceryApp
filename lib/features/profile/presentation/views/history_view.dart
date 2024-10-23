import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/utils/warningdialog.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/views/emptyViewBody.dart';
import 'package:grocery/core/widgets/totalcartappbar.dart';
import 'package:grocery/features/profile/data/models/viewed_model.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/viewedProductcubit/viewed_product_cubit.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/viewedProductcubit/viewed_product_state.dart';
import 'package:grocery/features/profile/presentation/widgets/historyviewbody.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewedProductCubit, ViewedProductState>(
      builder: (context, state) {
        var viewedProduct = context.read<ViewedProductCubit>();
        List<ViewedProductModel> viewedProductList =
            viewedProduct.getViewListItems.values.toList().reversed.toList();
        if (viewedProductList.isEmpty) {
          return const EmptyView(
            image: Assets.assetsImagesHistory,
            title: AppStrings.yourhistoryempty,
            subtitle: AppStrings.noProductsOnSale,
            btnTitle: AppStrings.shopNow,
          );
        }
        return Scaffold(
          appBar: TotalCartAppBar(
            title: AppStrings.history,
            numberofProduct: viewedProductList.length.toString(),
            isback: true,
            centertitle: true,
            isdeleteicon: true,
            deleteOnTap: () {
              GlobalMethod.warningDialog(
                context,
                title: AppStrings.emptyHistory,
                subTitle: AppStrings.areYouSure,
                onTapOK: () {
                  viewedProduct.clearHistory();
                  popAppRouter(context);
                },
              );
            },
          ),
          body: HistoryViewBody(
            viewedProductList: viewedProductList,
          ),
        );
      },
    );
  }
}
