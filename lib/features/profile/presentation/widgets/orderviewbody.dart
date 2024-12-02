import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/features/profile/data/models/order_model.dart';
import 'package:grocery/features/profile/presentation/widgets/orderListview.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key, required this.listOfOrders});
  final List<OrderModel> listOfOrders;
  @override
  Widget build(BuildContext context) {
    return OrderListView(
      listOfOrders: listOfOrders,
    );
  }
}
