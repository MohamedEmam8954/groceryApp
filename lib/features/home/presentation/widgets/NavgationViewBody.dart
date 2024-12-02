import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/categories/presentation/views/categoriesView.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/views/home_view.dart';
import 'package:grocery/features/profile/presentation/views/profile_view.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cart_cubit.dart';
import 'package:grocery/features/shopping/presentation/manager/cubit/cartcubit/cartcubitstate.dart';
import 'package:grocery/features/shopping/presentation/views/cart_view.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;

class NavgationViewBody extends StatefulWidget {
  const NavgationViewBody({super.key, required this.productmodel});
  final List<ProductModel> productmodel;

  @override
  State<NavgationViewBody> createState() => _NavgationViewBodyState();
}

class _NavgationViewBodyState extends State<NavgationViewBody> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[index]
          ["views"](context, widget.productmodel), // Pass productmodel to views
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
        items: [
          _buildNavItem(0, iconlyBold[0], iconlyLight[0], 'Home'),
          _buildNavItem(1, iconlyBold[1], iconlyLight[1], 'Category'),
          _buildCartNavItem(),
          _buildNavItem(3, iconlyBold[3], iconlyLight[3], 'Profile'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    int itemIndex,
    IconData activeIcon,
    IconData inactiveIcon,
    String label,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(index == itemIndex ? activeIcon : inactiveIcon),
      label: label,
    );
  }

  BottomNavigationBarItem _buildCartNavItem() {
    return BottomNavigationBarItem(
      icon: BlocBuilder<CartCubit, Cartstate>(
        builder: (context, state) {
          final cartItemCount = context.read<CartCubit>().cartItem.length;
          return badges.Badge(
            position: badges.BadgePosition.topEnd(top: -10, end: -12),
            badgeContent: FittedBox(
              child: Text(
                cartItemCount.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            badgeStyle: const badges.BadgeStyle(badgeColor: Colors.blue),
            child: Icon(index == 2 ? iconlyBold[2] : iconlyLight[2]),
          );
        },
      ),
      label: 'Cart',
    );
  }

  final List<Map<String, dynamic>> views = [
    {
      "views": (BuildContext context, List<ProductModel> productmodel) =>
          HomeView(productmodel: productmodel), // Pass productmodel to HomeView
      "title": 'Home'
    },
    {
      "views": (BuildContext context, List<ProductModel> productmodel) =>
          const CategoriesView(), // No productmodel needed here
      "title": 'Category'
    },
    {
      "views": (BuildContext context, List<ProductModel> productmodel) =>
          const Cartview(), // No productmodel needed here
      "title": 'Cart'
    },
    {
      "views": (BuildContext context, List<ProductModel> productmodel) =>
          const Profileview(), // No productmodel needed here
      "title": 'Profile'
    },
  ];

  final List<dynamic> iconlyLight = const [
    IconlyLight.home,
    IconlyLight.category,
    IconlyLight.buy,
    IconlyLight.user,
  ];

  final List<dynamic> iconlyBold = const [
    IconlyBold.home,
    IconlyBold.category,
    IconlyBold.buy,
    IconlyBold.user_2,
  ];
}
