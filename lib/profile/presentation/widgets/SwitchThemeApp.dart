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
      child: ListTile(
        title: Text(
          themeState.myCacheHelper.getData(key: AppConstant.themeStatus)
              ? AppStrings.darkMode
              : AppStrings.lightMode,
          style: AppStyles.style22,
        ),
        leading: themeState.myCacheHelper.getData(key: AppConstant.themeStatus)
            ? const Icon(
                Icons.dark_mode_outlined,
                color: Colors.grey,
              )
            : const Icon(
                Icons.light_mode_outlined,
                color: Colors.grey,
              ),
        trailing: SizedBox(
          width: 30,
          child: Transform.scale(
            scale: 0.8,
            child: Switch(
                value: themeState.myCacheHelper
                    .getData(key: AppConstant.themeStatus),
                onChanged: (bool value) {
                  themeState.setDarkTheme = value;
                  setState(() {});
                },
                activeColor: Colors.white,
                inactiveThumbColor: Colors.grey,
                activeTrackColor: const Color(0xFF00bed6).withOpacity(0.8)),
          ),
        ),
        onTap: () {
          // Handle tile tap if needed
        },
      ),
    );
  }
}
