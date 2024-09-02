import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/app/groceryapp.dart';
import 'package:grocery/core/cache/my_cache_helper.dart';
import 'package:grocery/core/models/my_blocobserver.dart';
import 'package:grocery/core/utils/dependencyInjection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  init();
  Bloc.observer = MyBlocObserver();
  await getIt.get<MyCacheHelper>().sharePerferences();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const GroceryApp());
}
