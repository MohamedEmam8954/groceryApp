import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/features/home/presentation/manager/darkThemecubit/dark_theme_cubit.dart';

class EmptyView extends StatelessWidget {
  const EmptyView(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.btnTitle});
  final String image, title, subtitle, btnTitle;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var gettheme = context.read<DarkThemeCubit>().getTheme();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    width: 300,
                    height: size.height * 0.38,
                    image,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppStrings.whoops,
                    style: AppStyles.style40,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    title,
                    style: AppStyles.style22.copyWith(
                        color: Colors.cyan, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    subtitle,
                    style: AppStyles.style22.copyWith(
                        color: const Color(0xff00bed6),
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomBtn(
                    radius: 10,
                    ontap: () {
                      navTo(context, AppRouter.browseAllProduct);
                    },
                    title: btnTitle,
                    color: Theme.of(context).colorScheme.secondary,
                    width: 140,
                    hight: 60,
                    textcolor:
                        gettheme ? Colors.grey.shade300 : Colors.grey.shade800,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
