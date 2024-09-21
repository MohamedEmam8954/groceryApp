import 'package:flutter/material.dart';
import 'package:grocery/features/profile/presentation/widgets/yourorderitem.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return const YourOrderItem();
      },
    );
  }
}
