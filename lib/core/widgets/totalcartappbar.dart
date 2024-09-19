import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/backwidget.dart';
import 'package:iconly/iconly.dart';

class TotalCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TotalCartAppBar(
      {super.key,
      required this.title,
      required this.numberofProduct,
      required this.deleteOnTap,
      this.isback = false});
  final String title, numberofProduct;
  final VoidCallback deleteOnTap;
  final bool isback;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isback ? const BackWidget() : null,
      title: Text(
        "$title($numberofProduct)",
        style: AppStyles.style20.copyWith(fontWeight: FontWeight.w700),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(IconlyLight.delete),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
