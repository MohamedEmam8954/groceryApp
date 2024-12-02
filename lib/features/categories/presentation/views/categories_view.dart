import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/utils/dependency_injection.dart';
import 'package:grocery/features/categories/presentation/widgets/categoriesViewbody.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/repo/home_repo_imp.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.category,
            style: AppStyles.style20,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: BlocProvider(
          create: (context) => AllProductDetailsCubit(getIt.get<HomeRepoImp>()),
          child: const CategoriesViewBody(),
        ),
      ),
    );
  }
}
