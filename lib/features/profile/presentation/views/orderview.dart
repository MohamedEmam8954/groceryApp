import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/totalcartappbar.dart';
import 'package:grocery/features/profile/presentation/widgets/orderviewbody.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: TotalCartAppBar(
          isback: true,
          centertitle: true,
          title: AppStrings.yourOrder,
          numberofProduct: "10",
          isdeleteicon: false,
        ),
        body: OrderViewBody(),
      ),
    );
  }
}
