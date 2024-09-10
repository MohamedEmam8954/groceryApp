import 'package:flutter/material.dart';
import 'package:grocery/features/home/presentation/widgets/onsalewidget.dart';

class OnsaleListView extends StatelessWidget {
  const OnsaleListView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.27,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: OnSaleWidget(),
          );
        },
      ),
    );
  }
}
