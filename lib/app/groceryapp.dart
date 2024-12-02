import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/constant/app_Theme.dart';
import 'package:grocery/core/cache/my_cache_helper.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/app/darkThemecubit/dark_theme_cubit.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/repo/home_repo_imp.dart';
import 'package:grocery/features/profile/data/repo/wishListRepo/wishlist_repo_imp.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/viewedProductcubit/viewed_product_cubit.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/wishlistcubit/wish_list_cubit.dart';
import 'package:grocery/features/shopping/data/repo/cart_repo_imp.dart';
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
            create: (context) => CartCubit(
                homeRepo: getIt.get<HomeRepoImp>(),
                cartRepo: getIt.get<CartRepoImp>())),
        BlocProvider(
          create: (context) => WishListCubit(getIt.get<WishlistRepoImp>()),
        ),
        BlocProvider(
          create: (context) => ViewedProductCubit(),
        ),
        BlocProvider(
            create: (context) =>
                AllProductDetailsCubit(getIt.get<HomeRepoImp>()))
      ],
      child: BlocBuilder<DarkThemeCubit, DarkThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: AppTheme.themeData(state.isDark, context),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.goRoute,
          );
        },
      ),
    );
  }
}
