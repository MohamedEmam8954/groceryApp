import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/onsalewidget.dart';
import 'package:redacted/redacted.dart';

class OnsaleListView extends StatelessWidget {
  const OnsaleListView({super.key, required this.productModel});
  final List<ProductModel> productModel;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<ProductModel> productOnSale =
        context.read<AllProductDetailsCubit>().productOnSale;
    return SizedBox(
      height: size.height * 0.27,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: productOnSale.length < 10 ? productOnSale.length : 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: OnSaleWidget(
              productModel: productOnSale[index],
            ).redacted(context: context, redact: false),
          );
        },
      ),
    );
  }
}
