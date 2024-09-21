import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/core/widgets/product_textfield.dart';

class AddOrMinusProduct extends StatefulWidget {
  const AddOrMinusProduct(
      {super.key,
      required this.txtFieldSize,
      this.mainAxisAlignment,
      required this.addIcon,
      required this.minusIcon});
  final double txtFieldSize;
  final MainAxisAlignment? mainAxisAlignment;
  final IconData addIcon, minusIcon;

  @override
  State<AddOrMinusProduct> createState() => _AddOrMinusProductState();
}

class _AddOrMinusProductState extends State<AddOrMinusProduct> {
  TextEditingController controller = TextEditingController(text: '1');
  int addProduct = 1;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
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
            icon: widget.minusIcon,
            width: 35,
            hight: 35,
          ),
        ),
        SizedBox(
          width: widget.txtFieldSize,
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
            icon: widget.addIcon,
            width: 35,
            hight: 35,
          ),
        ),
      ],
    );
  }
}
