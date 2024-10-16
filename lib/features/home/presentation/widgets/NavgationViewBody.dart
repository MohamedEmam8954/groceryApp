import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/categories/presentation/views/categoriesView.dart';
import 'package:grocery/features/home/presentation/views/home_view.dart';
import 'package:grocery/features/shopping/presentation/views/cart_view.dart';
import 'package:grocery/features/profile/presentation/views/profile_view.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;

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
            icon: index == 2
                ? badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -10, end: -12),
                    badgeAnimation: const badges.BadgeAnimation.rotation(
                      animationDuration: Duration(seconds: 1),
                      colorChangeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    showBadge: true,
                    badgeContent: FittedBox(
                      child: Text(
                        "1",
                        style: AppStyles.style15.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    badgeStyle:
                        const badges.BadgeStyle(badgeColor: Colors.blue),
                    onTap: () {},
                    child: Icon(iconlyBold[2]),
                  )
                : badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -10, end: -12),
                    showBadge: true,
                    badgeAnimation: const badges.BadgeAnimation.rotation(
                      animationDuration: Duration(seconds: 1),
                      colorChangeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    badgeContent: FittedBox(
                      child: Text(
                        "5",
                        style: AppStyles.style15.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    badgeStyle:
                        const badges.BadgeStyle(badgeColor: Colors.blue),
                    onTap: () {},
                    child: Icon(iconlyLight[2]),
                  ),
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
