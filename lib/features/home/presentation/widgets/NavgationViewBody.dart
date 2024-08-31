import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/features/categories/presentation/views/categoriesView.dart';
import 'package:grocery/features/home/presentation/views/homeView.dart';
import 'package:grocery/features/shopping/presentation/views/cartView.dart';
import 'package:grocery/profile/presentation/views/profileView.dart';
import 'package:iconly/iconly.dart';

class NavgationViewBody extends StatefulWidget {
  const NavgationViewBody({super.key});

  @override
  State<NavgationViewBody> createState() => _NavgationViewBodyState();
}

class _NavgationViewBodyState extends State<NavgationViewBody> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(views[index]["title"]),
      // ),
      body: views[index]["views"],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
        items: [
          BottomNavigationBarItem(
            icon: index == 0 ? Icon(iconlyBold[0]) : Icon(iconlyLight[0]),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: index == 1 ? Icon(iconlyBold[1]) : Icon(iconlyLight[1]),
            label: AppStrings.category,
          ),
          BottomNavigationBarItem(
            icon: index == 2 ? Icon(iconlyBold[2]) : Icon(iconlyLight[2]),
            label: AppStrings.cart,
          ),
          BottomNavigationBarItem(
            icon: index == 3 ? Icon(iconlyBold[3]) : Icon(iconlyLight[3]),
            label: AppStrings.profile,
          ),
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> views = const [
    {
      "views": HomeView(),
      "title": AppStrings.home,
    },
    {
      "views": CategoriesView(),
      "title": AppStrings.category,
    },
    {
      "views": Cartview(),
      "title": AppStrings.cart,
    },
    {
      "views": Profileview(),
      "title": AppStrings.profile,
    }
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
