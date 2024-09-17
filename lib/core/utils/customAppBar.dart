import 'package:flutter/material.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:iconly/iconly.dart';

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
      leading: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          popAppRouter(context);
        },
        child: const Icon(IconlyLight.arrow_left_2),
      ),
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
      IconButton(onPressed: () {}, icon: const Icon(IconlyLight.bag_2)),
      IconButton(onPressed: () {}, icon: const Icon(IconlyLight.heart)),
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
