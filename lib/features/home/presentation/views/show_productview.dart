import 'package:flutter/material.dart';
import 'package:grocery/features/home/presentation/widgets/showProductbody.dart';

class ShowProductView extends StatelessWidget {
  const ShowProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ShowProductBody(),
      ),
    );
  }
}
