import 'package:flutter/material.dart';
import 'package:grocery/features/home/presentation/widgets/Cardswaper.dart';

class CardSwapperSection extends StatelessWidget {
  const CardSwapperSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.33,
          child: const CardSwaper(),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
