import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/features/home/presentation/widgets/iconFav.dart';
import 'package:grocery/features/home/presentation/widgets/incartBtn.dart';
import 'package:grocery/features/home/presentation/widgets/pricewidgets.dart';
import 'package:grocery/features/home/presentation/widgets/product_textfield.dart';

class GroceryProductHome extends StatefulWidget {
  const GroceryProductHome({super.key});

  @override
  State<GroceryProductHome> createState() => _GroceryProductHomeState();
}

class _GroceryProductHomeState extends State<GroceryProductHome> {
  TextEditingController controller =
      TextEditingController(text: '1'); // Set initial value

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              Image.asset(
                Assets.assetsImagesCatVeg,
                fit: BoxFit.fill,
                width: size.width * 0.22,
                height: size.width * 0.25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Avocat",
                      style: AppStyles.style22
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    IconFav(onFavTap: () {})
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: PriceWidget(
                          onsale: true,
                          onsaleprice: 2.66,
                          price: 7.5,
                          textPrice: controller.text),
                    ),
                    Row(
                      children: [
                        Text(
                          " ${AppStrings.kg}",
                          style: AppStyles.style22
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 30,
                          child: ProductTextField(
                            controller: controller,
                            onchanged: (value) {
                              setState(() {
                                if (value.isEmpty) {
                                  // Reset the text to '1' when the field is cleared
                                  controller.text = '1';
                                }
                                setState(() {});
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              IncartBtn(ontap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
