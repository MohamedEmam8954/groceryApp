import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/constant/constant.dart';
import 'package:grocery/core/cache/my_cache_helper.dart';

part 'dark_theme_state.dart';

class DarkThemeCubit extends Cubit<DarkThemeState> {
  final MyCacheHelper myCacheHelper;

  // Initialize the Cubit with the saved theme from cache
  DarkThemeCubit(this.myCacheHelper)
      : super(DarkThemeState(
            isDark:
                myCacheHelper.getData(key: AppConstant.themeStatus) ?? false));

  void toggleTheme() {
    final newTheme = !state.isDark;
    myCacheHelper.sendData(data: newTheme, key: AppConstant.themeStatus);
    emit(DarkThemeState(isDark: newTheme));
  }

  Color get currentTextColor => state.isDark ? Colors.white : Colors.black;
}
