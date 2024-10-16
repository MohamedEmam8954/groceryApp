import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/constant/app_Theme.dart';
import 'package:grocery/constant/constant.dart';
import 'package:grocery/core/cache/my_cache_helper.dart';
import 'package:grocery/core/utils/dependencyInjection.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/manager/darkThemecubit/dark_theme_cubit.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/viewedProductcubit/viewed_product_cubit.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/wishlistcubit/wish_list_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DarkThemeCubit(getIt.get<MyCacheHelper>()),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => AllProductDetailsCubit(),
        ),
        BlocProvider(
          create: (context) => WishListCubit(),
        ),
        BlocProvider(
          create: (context) => ViewedProductCubit(),
        ),
      ],
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
