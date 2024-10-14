import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/features/home/presentation/widgets/onSaleRotated.dart';
import 'package:grocery/features/home/presentation/widgets/onsalelistView.dart';

class OnSaleSection extends StatelessWidget {
  const OnSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            // navTo(context, AppRouter.onsaleView,extra:productmodel );
            GoRouter.of(context).push(AppRouter.onsaleView);
          },
          child: Text(
            AppStrings.viewAll,
            style: AppStyles.style20,
          ),
        ),
        const Row(
          children: [
            OnSaleRotated(),
            SizedBox(
              width: 8,
            ),
            Expanded(child: OnsaleListView()),
          ],
        ),
      ],
    );
  }
}
