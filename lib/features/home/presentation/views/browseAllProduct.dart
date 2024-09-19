import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/customAppBar.dart';
import 'package:grocery/features/home/presentation/widgets/browseallProductBody.dart';

class BrowseAllProductView extends StatelessWidget {
  const BrowseAllProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: AppStrings.allProducts),
        body: BrowseAllProductBody(),
      ),
    );
  }
}
