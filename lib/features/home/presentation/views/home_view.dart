import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/homeViewBody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => AllProductDetailsCubit(),
          child: const HomeViewBody(),
        ),
      ),
    );
  }
}
