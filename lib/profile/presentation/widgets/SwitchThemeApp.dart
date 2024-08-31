import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/constant/constant.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/home/presentation/manager/darkThemecubit/dark_theme_cubit.dart';

class SwitchThemeApp extends StatefulWidget {
  const SwitchThemeApp({super.key});

  @override
  State<SwitchThemeApp> createState() => _SwitchThemeAppState();
}

class _SwitchThemeAppState extends State<SwitchThemeApp> {
  @override
  Widget build(BuildContext context) {
    final themeState = BlocProvider.of<DarkThemeCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: SwitchListTile(
        title: Text(
          AppStrings.theme,
          style: AppStyles.style22,
        ),
        secondary:
            themeState.myCacheHelper.getData(key: AppConstant.themeStatus)
                ? const Icon(Icons.dark_mode_outlined)
                : const Icon(Icons.light_mode_outlined),
        value: themeState.myCacheHelper.getData(key: AppConstant.themeStatus),
        onChanged: (bool value) {
          themeState.setDarkTheme = value;
          setState(() {});
        },
        activeColor: Colors.amber, // Color for the active state
        inactiveThumbColor: Colors.grey, // Color for the inactive state
        activeTrackColor:
            Colors.amber.withOpacity(0.5), // Track color when active
        inactiveTrackColor: Colors.grey.withOpacity(0.5),
      ),
    );
  }
}
