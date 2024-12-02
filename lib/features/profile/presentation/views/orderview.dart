import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grocery/app/darkThemecubit/dark_theme_cubit.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/views/emptyViewBody.dart';
import 'package:grocery/core/widgets/loading_widget.dart';
import 'package:grocery/core/widgets/totalcartappbar.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/orderCubit/order_cubit.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/orderCubit/order_cubit_state.dart';
import 'package:grocery/features/profile/presentation/widgets/orderviewbody.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  void initState() {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      context.read<OrderCubit>().getOrders();
    } else {
      context.read<OrderCubit>().removeAllOrders();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var color = context.read<DarkThemeCubit>().currentTextColor;
    return SafeArea(
      child: BlocBuilder<OrderCubit, OrderCubitState>(
        builder: (context, state) {
          var orderCubit = context.read<OrderCubit>();
          if (orderCubit.orderList.isEmpty) {
            return const EmptyView(
              image: Assets.assetsImagesCart,
              title: AppStrings.yourOrderIsEmpty,
              subtitle: AppStrings.addSomethingMakeMeHappy,
              btnTitle: AppStrings.orderNow,
            );
          } else {
            if (state is LoadingGettingOrderState) {
              return Scaffold(
                body: Center(
                  child: SpinKitFadingCube(
                    color: color,
                    size: 45,
                  ),
                ),
              );
            } else {
              return Scaffold(
                appBar: TotalCartAppBar(
                  isback: true,
                  centertitle: true,
                  title: AppStrings.yourOrder,
                  numberofProduct: orderCubit.orderList.length.toString(),
                  isdeleteicon: false,
                ),
                body: OrderViewBody(
                  listOfOrders: orderCubit.orderList,
                ),
              );
            }
          }
        },
      ),
    );
  }
}
