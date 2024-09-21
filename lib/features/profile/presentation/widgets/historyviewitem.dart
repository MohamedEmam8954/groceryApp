import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/features/home/presentation/manager/darkThemecubit/dark_theme_cubit.dart';

class HistoryViewItem extends StatelessWidget {
  const HistoryViewItem({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var color = context.read<DarkThemeCubit>().color();
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width * 0.2,
                height: size.width * 0.23,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.assetsImagesCatVeg),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    "Title x12",
                    style: AppStyles.style20,
                  ),
                  Text(
                    "Paid:\$12.8 ",
                    style: AppStyles.style16.copyWith(
                        color: color.withOpacity(0.3),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomBtn(
                  color: Colors.green,
                  ontap: () {},
                  icon: CupertinoIcons.plus,
                  width: 35,
                  hight: 35,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
