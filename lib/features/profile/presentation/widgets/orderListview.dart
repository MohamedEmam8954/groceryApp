import 'package:flutter/material.dart';

import 'package:grocery/features/profile/data/models/order_model.dart';
import 'package:grocery/features/profile/presentation/widgets/yourorderitem.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key, required this.listOfOrders});
  final List<OrderModel> listOfOrders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfOrders.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return YourOrderItem(
          orderModel: listOfOrders[index],
        );
      },
    );
  }
}
