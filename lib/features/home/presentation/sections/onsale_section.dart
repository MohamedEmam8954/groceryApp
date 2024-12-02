import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/all_product_state.dart';
import 'package:grocery/features/home/presentation/manager/allProductdetailscubit/allproduct_details_model.dart';
import 'package:grocery/features/home/presentation/widgets/onSaleRotated.dart';
import 'package:grocery/features/home/presentation/widgets/onsalelistView.dart';

class OnSaleSection extends StatefulWidget {
  const OnSaleSection({
    super.key,
  });

  @override
  State<OnSaleSection> createState() => _OnSaleSectionState();
}

class _OnSaleSectionState extends State<OnSaleSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            // navTo(context, AppRouter.onsaleView,extra:productmodel );
            GoRouter.of(context).push(
              AppRouter.onsaleView,
            );
          },
          child: Text(
            AppStrings.viewAll,
            style: AppStyles.style20,
          ),
        ),
        Row(
          children: [
            const OnSaleRotated(),
            const SizedBox(
              width: 8,
            ),
            BlocBuilder<AllProductDetailsCubit, AllProductState>(
              builder: (context, state) {
                List<ProductModel> isOnsale =
                    BlocProvider.of<AllProductDetailsCubit>(context)
                        .productOnSale;
                return Expanded(
                    child: OnsaleListView(
                  productModel: isOnsale,
                ));
              },
            ),
          ],
        ),
      ],
    );
  }
}
