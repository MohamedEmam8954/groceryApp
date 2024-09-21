import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/constant/app_Theme.dart';
import 'package:grocery/constant/constant.dart';
import 'package:grocery/core/cache/my_cache_helper.dart';
import 'package:grocery/core/utils/dependencyInjection.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/features/home/presentation/manager/darkThemecubit/dark_theme_cubit.dart';

class GroceryApp extends StatefulWidget {
  const GroceryApp({super.key});

  @override
  State<GroceryApp> createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DarkThemeCubit(getIt.get<MyCacheHelper>()),
      child: BlocBuilder<DarkThemeCubit, DarkThemeState>(
        builder: (context, state) {
          final themeState = BlocProvider.of<DarkThemeCubit>(context);
          return MaterialApp.router(
            theme: AppTheme.themeData(
                themeState.myCacheHelper.getData(key: AppConstant.themeStatus),
                context),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.goRoute,
          );
        },
      ),
    );
  }
}
