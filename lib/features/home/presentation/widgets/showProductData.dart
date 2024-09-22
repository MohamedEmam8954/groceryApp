import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/core/widgets/iconFav.dart';
import 'package:grocery/features/home/presentation/widgets/price_per_widget.dart';

class ShowProductData extends StatelessWidget {
  const ShowProductData(
      {super.key,
      required this.nameOfProduct,
      required this.productPrice,
      required this.onFavTap,
      required this.freeDeliveryVisible});
  final String nameOfProduct, productPrice;
  final VoidCallback onFavTap;
  final bool freeDeliveryVisible;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nameOfProduct,
                  style:
                      AppStyles.style22.copyWith(fontWeight: FontWeight.bold),
                ),
                IconFav(onFavTap: onFavTap)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PricePerKgText(
                  price: productPrice,
                  color: Colors.green,
                  kg: AppStrings.kg,
                ),
                Visibility(
                  visible: freeDeliveryVisible,
                  child: CustomBtn(
                    radius: 10,
                    ontap: () {},
                    title: AppStrings.freeDelivery,
                    padding: 7,
                    color: const Color(0xff62d281),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
