import 'dart:developer'; // For logging
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/all_product_state.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/NavgationViewBody.dart';
import 'package:grocery/features/home/presentation/widgets/loadingScreen.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/wishlistcubit/wish_list_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';

class NavgationView extends StatefulWidget {
  const NavgationView({super.key});

  @override
  State<NavgationView> createState() => _NavgationViewState();
}

class _NavgationViewState extends State<NavgationView> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    User? user = FirebaseAuth.instance.currentUser;

    log('Current user: $user');

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });

    if (user == null) {
      log('No user is logged in. Fetching products only.');
      context.read<AllProductDetailsCubit>().fetchData();
      context.read<CartCubit>().deleteAllCartItems();
      context.read<WishListCubit>().deleteAllWishList();
    } else {
      log('Authenticated user is logged in. Fetching products and cart data.');
      context.read<AllProductDetailsCubit>().fetchData();
      context.read<CartCubit>().fetchDatafromCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const LoadingScreen();
    }

    List<ProductModel>? productModel;

    return Scaffold(
      body: BlocConsumer<AllProductDetailsCubit, AllProductState>(
        listener: (context, state) {
          // Handle errors when fetching data
          if (state is FailuresToFetchData) {
            log('Failed to fetch data: ${state.errorMessage}');
          }
        },
        builder: (context, state) {
          if (state is SucessToFetchData) {
            productModel = state.productModel;
            log('Successfully fetched product data');
          } else if (state is FailuresToFetchData) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          } else if (state is LoadingToFetchData) {
            return const LoadingScreen(); // Show loading screen
          }

          return NavgationViewBody(
              productmodel: productModel ??
                  []); // Ensure fallback to an empty list if productModel is null
        },
      ),
    );
  }
}
