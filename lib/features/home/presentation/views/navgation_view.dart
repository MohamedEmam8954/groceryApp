import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/presentation/widgets/NavgationViewBody.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';

class NavgationView extends StatelessWidget {
  const NavgationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NavgationViewBody(),
    );
  }
}
