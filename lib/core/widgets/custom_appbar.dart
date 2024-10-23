import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/backwidget.dart';

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
      //! add icon baaaaaaaaaaaaaaaaag
      // IconBag(onBagTap: () {}),
      Icon(Icons.favorite),
      const SizedBox(
        width: 10,
      ),
      //! add Icon Favvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
      // IconFav(),
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
