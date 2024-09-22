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
    required this.maxlines,
    this.isauth = false,
    this.suffixicon,
  });

  final void Function(String)? oncChanged;
  final String? Function(String?)? validator;
  final String hintext;
  final TextEditingController controller;
  final int maxlines;
  final bool isauth;
  final IconData? suffixicon;

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
      style: TextStyle(color: isauth ? Colors.white : null, fontSize: 16),
      maxLines: 1,
      decoration: InputDecoration(
        border: underlineInputBorder(),
        enabledBorder: underlineInputBorder(),
        focusedBorder: underlineInputBorder(),
        hintText: hintext,
        hintStyle: TextStyle(color: isauth ? Colors.white : hintTextColor),
        suffixIcon: Icon(
          suffixicon,
          color: Colors.white,
        ),
      ),
    );
  }

  UnderlineInputBorder underlineInputBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: isauth ? Colors.white : Colors.black),
    );
  }
}
