import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/all_product_state.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/noProductSale.dart';
import 'package:grocery/features/home/presentation/widgets/productsOnSaleGridView.dart';

class OnSaleViewBody extends StatelessWidget {
  const OnSaleViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = BlocProvider.of<AllProductDetailsCubit>(context);
    return BlocBuilder<AllProductDetailsCubit, AllProductState>(
      builder: (context, state) {
        return Column(
          children: [
            data.productOnSale.isEmpty
                ? const NoProductYet(
                    title: AppStrings.noProductsOnSale,
                  )
                : ProductsOnSaleGridView(
                    sale: data.productOnSale,
                  ),
          ],
        );
      },
    );
  }
}
