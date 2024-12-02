import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/app/darkThemecubit/dark_theme_cubit.dart';
import 'package:iconly/iconly.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key, this.iconcolor = false});
  final bool iconcolor;

  @override
  Widget build(BuildContext context) {
    var color = context.read<DarkThemeCubit>().currentTextColor;
    return IconButton(
      onPressed: () {
        Navigator.canPop(context) ? popAppRouter(context) : null;
      },
      icon: Icon(
        IconlyLight.arrow_left_2,
        color: iconcolor ? Colors.white : color,
      ),
    );
  }
}
