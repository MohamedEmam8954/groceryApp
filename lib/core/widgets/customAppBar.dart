import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/backwidget.dart';
import 'package:grocery/core/widgets/bagicon.dart';
import 'package:grocery/core/widgets/iconFav.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.action = true,
  });
  final String title;
  final bool action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: const BackWidget(),
      title: Text(
        title,
        style: AppStyles.style24.copyWith(fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      actions: action ? _icons() : [],
    );
  }

  List<Widget> _icons() {
    return [
      IconBag(onBagTap: () {}),
      const SizedBox(
        width: 10,
      ),
      IconFav(onFavTap: () {})
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
