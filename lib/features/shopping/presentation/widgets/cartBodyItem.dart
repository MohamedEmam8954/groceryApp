import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/utils/appAssets.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/utils/customBtn.dart';
import 'package:grocery/core/utils/product_textfield.dart';
import 'package:grocery/features/home/presentation/widgets/iconFav.dart';

class CartBodyItem extends StatefulWidget {
  const CartBodyItem({super.key});

  @override
  State<CartBodyItem> createState() => _CartBodyItemState();
}

class _CartBodyItemState extends State<CartBodyItem> {
  TextEditingController controller = TextEditingController(text: '1');
  int addProduct = 1;
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width * 0.25,
                  height: size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Image.asset(
                    Assets.assetsImagesCatFruits,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Peas",
                            style: AppStyles.style22
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: CustomBtn(
                                  color: Colors.red,
                                  ontap: () {
                                    if (addProduct > 1) {
                                      addProduct--;
                                      controller.text = addProduct.toString();
                                      log("add product -- $addProduct");
                                    }
                                    setState(() {});
                                  },
                                  title: "-",
                                  width: 35,
                                  hight: 35,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                                child: ProductTextField(
                                  controller: controller,
                                  onchanged: (value) {
                                    if (value.isEmpty) {
                                      controller.text = '1';
                                    }
                                    addProduct = int.parse(controller.text);
                                    log(addProduct.toString());
                                    setState(() {});
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: CustomBtn(
                                  ontap: () {
                                    if (addProduct >= 1) {
                                      addProduct++;
                                      log("add product ++ $addProduct");
                                      controller.text = addProduct.toString();
                                    }
                                    setState(() {});
                                  },
                                  title: "+",
                                  width: 35,
                                  hight: 35,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          IconFav(onFavTap: () {}),
                          FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              "\$ 3.999",
                              style: AppStyles.style20,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
