import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/custom_appbar.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/onSaleViewBody.dart';

class OnSaleView extends StatelessWidget {
  const OnSaleView({super.key, this.isSale = true});
  final bool isSale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.productsOnSale,
        action: false,
      ),
      body: BlocProvider(
        create: (context) => AllProductDetailsCubit(),
        child: OnSaleViewBody(isSale: isSale),
      ),
    );
  }
}
