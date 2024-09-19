import 'package:flutter/material.dart';
import 'package:grocery/features/shopping/presentation/widgets/cartBodyItem.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(6),
      itemBuilder: (context, index) {
        return const CartBodyItem();
      },
    );
  }
}
