import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/bagicon.dart';
import 'package:grocery/core/widgets/iconFav.dart';
import 'package:grocery/features/home/presentation/manager/darkThemecubit/dark_theme_cubit.dart';

import '../../../../core/function/navigationApp.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Color color = context.read<DarkThemeCubit>().color();
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          navTo(context, AppRouter.showProduct);
        },
        child: Container(
          height: size.height * 0.20,
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 0.5),
            color: Theme.of(context).cardColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8),
                height: size.width * 0.2,
                width: size.width * 0.25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        Assets.assetsImagesCatFruits,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconBag(onBagTap: () {}),
                      const SizedBox(
                        width: 8,
                      ),
                      IconFav(onFavTap: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Avocat",
                    style: AppStyles.style22,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$0.99",
                    style: AppStyles.style22,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
