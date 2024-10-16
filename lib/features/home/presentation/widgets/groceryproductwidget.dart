import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/iconFav.dart';
import 'package:grocery/features/home/data/model/product_model.dart';
import 'package:grocery/features/home/presentation/widgets/incartBtn.dart';
import 'package:grocery/features/home/presentation/widgets/pricewidgets.dart';
import 'package:grocery/core/widgets/product_textfield.dart';

class GroceryProductHome extends StatefulWidget {
  const GroceryProductHome({super.key, required this.productModel});
  final ProductModel productModel;

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
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              // navTo(context, AppRouter.productDetails, extra: product[index]);
              GoRouter.of(context)
                  .push(AppRouter.productDetails, extra: widget.productModel);
            },
            child: Material(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 3, right: 3),
                child: Column(
                  children: [
                    Image.asset(
                      widget.productModel.imgUrl,
                      fit: BoxFit.fill,
                      width: size.width * 0.22,
                      height: size.width * 0.25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Text(
                              widget.productModel.title,
                              style: AppStyles.style22
                                  .copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: IconFav(
                              productId: widget.productModel.id,
                            ),
                          )
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
                                onsale: widget.productModel.isOnsale,
                                onsaleprice: widget.productModel.salePrice,
                                price: widget.productModel.price,
                                textPrice: controller.text),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.productModel.isPiece
                                    ? AppStrings.piece
                                    : " ${AppStrings.kg}",
                                style: AppStyles.style17
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
                  ],
                ),
              ),
            ),
          ),
          IncartBtn(
            productModel: widget.productModel,
            controller: controller,
            color: Theme.of(context).focusColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
