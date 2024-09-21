import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/backwidget.dart';
import 'package:iconly/iconly.dart';

class TotalCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TotalCartAppBar(
      {super.key,
      required this.title,
      required this.numberofProduct,
      this.deleteOnTap,
      this.isback = false,
      this.centertitle = false,
      this.isdeleteicon = true});
  final String title, numberofProduct;
  final VoidCallback? deleteOnTap;
  final bool isback, centertitle, isdeleteicon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centertitle,
      automaticallyImplyLeading: false,
      leading: isback ? const BackWidget() : null,
      title: Text(
        "$title($numberofProduct)",
        style: AppStyles.style20.copyWith(fontWeight: FontWeight.w700),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: isdeleteicon
          ? [
              IconButton(
                onPressed: deleteOnTap,
                icon: const Icon(IconlyLight.delete),
              )
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
