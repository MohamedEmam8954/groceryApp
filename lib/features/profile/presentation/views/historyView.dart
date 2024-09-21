import 'package:flutter/material.dart';
import 'package:grocery/core/function/warningdialog.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/views/emptyViewBody.dart';
import 'package:grocery/core/widgets/totalcartappbar.dart';
import 'package:grocery/features/profile/presentation/widgets/historyviewbody.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isempty = true;
    if (_isempty) {
      return const EmptyView(
        image: Assets.assetsImagesHistory,
        title: AppStrings.yourhistoryempty,
        subtitle: AppStrings.noProductsOnSale,
        btnTitle: AppStrings.shopNow,
      );
    } else {
      return Scaffold(
        appBar: TotalCartAppBar(
          title: AppStrings.history,
          numberofProduct: "10",
          isback: true,
          centertitle: true,
          isdeleteicon: true,
          deleteOnTap: () {
            GlobalMethod.warningDialog(
              context,
              title: AppStrings.emptyHistory,
              subTitle: AppStrings.areYouSure,
              onTapOK: () {},
            );
          },
        ),
        body: const HistoryViewBody(),
      );
    }
  }
}
