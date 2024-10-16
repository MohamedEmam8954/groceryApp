import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/customAppBar.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/browseallProductBody.dart';

class BrowseAllProductView extends StatelessWidget {
  const BrowseAllProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: AppStrings.allProducts),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AllProductDetailsCubit(),
            ),
            // BlocProvider(
            //   create: (context) => CartCubit(),
            // ),
          ],
          child: const BrowseAllProductBody(),
        ),
      ),
    );
  }
}
