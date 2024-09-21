import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/constant/constant.dart';
import 'package:grocery/core/cache/my_cache_helper.dart';

part 'dark_theme_state.dart';

class DarkThemeCubit extends Cubit<DarkThemeState> {
  DarkThemeCubit(this.myCacheHelper) : super(DarkThemeInitial()) {
    // getCurrentAppTheme();
  }

  final MyCacheHelper myCacheHelper;
  bool _darkTheme = false;

  bool get getdarkTheme {
    return _darkTheme;
  }

  set setDarkTheme(bool value) {
    // log("set dark theme value $value");
    _darkTheme = value;
    myCacheHelper.sendData(data: value, key: AppConstant.themeStatus);
    emit(SetDarkTheme());
  }

  Color color() {
    bool isdark = myCacheHelper.getData(key: AppConstant.themeStatus);
    if (isdark) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  bool getTheme() {
    return myCacheHelper.getData(key: AppConstant.themeStatus);
  }
}
