import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/constant/constant.dart';
import 'package:grocery/core/cache/my_cache_helper.dart';
import 'package:grocery/core/utils/dependencyInjection.dart';
import 'package:meta/meta.dart';

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

  // void getCurrentAppTheme() async {
  //   setDarkTheme =
  //       await myCacheHelper.getData(key: AppConstant.themeStatus) ?? false;
  // }
}
