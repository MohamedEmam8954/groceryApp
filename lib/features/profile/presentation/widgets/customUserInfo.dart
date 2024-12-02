import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/profile/presentation/manager/cubit/userData/userdata_cubit.dart';

class CustomUserInfo extends StatelessWidget {
  const CustomUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: BlocBuilder<UserdataCubit, UserdataState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "Hi, ",
                        style: AppStyles.style32.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            log("My Name");
                          }),
                    TextSpan(
                      text: state is UserdataLoading
                          ? AppStrings.loading
                          : state is Userdatasucess
                              ? state.name
                              : AppStrings.name,
                      style: AppStyles.style24.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                state is UserdataLoading
                    ? AppStrings.loading
                    : state is Userdatasucess
                        ? state.email
                        : AppStrings.email,
                style: AppStyles.style18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
