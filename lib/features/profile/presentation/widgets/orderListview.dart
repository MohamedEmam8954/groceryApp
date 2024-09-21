import 'package:flutter/material.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/features/profile/presentation/widgets/yourorderitem.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return YourOrderItem(
          ontap: () {
            navTo(context, AppRouter.productDetails);
          },
        );
      },
    );
  }
}
