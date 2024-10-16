import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/features/profile/data/models/viewed_model.dart';

import 'package:grocery/features/profile/presentation/widgets/historylistView.dart';

//! here change it to HistoryListView
class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key, required this.viewedProductList});
  final List<ViewedProductModel> viewedProductList;

  @override
  Widget build(BuildContext context) {
    return HistoryListView(
      viewedProductList: viewedProductList,
    );
  }
}
