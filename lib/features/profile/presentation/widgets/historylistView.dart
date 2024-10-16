import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/profile/data/models/viewed_model.dart';
import 'package:grocery/features/profile/presentation/widgets/historyviewitem.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({
    super.key,
    required this.viewedProductList,
  });
  final List<ViewedProductModel> viewedProductList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewedProductList.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return HistoryViewItem(
          productModel: context
              .read<AllProductDetailsCubit>()
              .findByIdFun(productId: viewedProductList[index].productId),
        );
      },
    );
  }
}
