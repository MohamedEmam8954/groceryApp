import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_styles.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {super.key,
      required this.onsale,
      required this.onsaleprice,
      required this.price,
      required this.textPrice});
  final bool onsale;
  final num onsaleprice;
  final double price;
  final String textPrice;

  @override
  Widget build(BuildContext context) {
    num userprice = onsale ? onsaleprice : price;
    return FittedBox(
      child: Row(
        children: [
          Text(
            "\$${(userprice * double.parse(textPrice)).toStringAsFixed(2)}",
            style: AppStyles.style18
                .copyWith(color: Colors.green, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 5,
          ),
          Visibility(
            visible: onsale ? true : false,
            child: Text(
              "\$${(price * double.parse(textPrice)).toStringAsFixed(2)}",
              style: AppStyles.style15.copyWith(
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
