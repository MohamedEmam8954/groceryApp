import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/constant/constant.dart';
import 'package:grocery/features/home/presentation/manager/darkThemecubit/dark_theme_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.oncChanged,
    this.validator,
    required this.hintext,
    required this.controller,
  });

  final void Function(String)? oncChanged;
  final String? Function(String?)? validator;
  final String hintext;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = BlocProvider.of<DarkThemeCubit>(context)
        .myCacheHelper
        .getData(key: AppConstant.themeStatus);

    // Define hint text color based on the theme
    final hintTextColor = isDarkTheme
        ? theme.textTheme.bodySmall?.color
            ?.withOpacity(0.7) // Use a lighter color for dark theme
        : theme.textTheme.bodySmall?.color?.withOpacity(0.7);
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: oncChanged,
      maxLines: 5,
      decoration: InputDecoration(
          hintText: hintext, hintStyle: TextStyle(color: hintTextColor)),
    );
  }
}
