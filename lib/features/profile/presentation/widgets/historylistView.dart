import 'package:flutter/material.dart';
import 'package:grocery/features/profile/presentation/widgets/historyviewitem.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return HistoryViewItem(ontap: () {});
        });
  }
}
