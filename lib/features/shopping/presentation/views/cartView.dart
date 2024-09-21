import 'package:flutter/material.dart';
import 'package:grocery/core/function/warningdialog.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/totalcartappbar.dart';
import 'package:grocery/features/shopping/presentation/widgets/cartViewBody.dart';

class Cartview extends StatelessWidget {
  const Cartview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TotalCartAppBar(
        title: AppStrings.cart,
        numberofProduct: "3",
        deleteOnTap: () {
          GlobalMethod.warningDialog(
            context,
            title: AppStrings.emptyCart,
            subTitle: AppStrings.areYouSure,
            onTapOK: () {},
          );
        },
      ),
      body: const CartViewBody(),
    );
  }
}
