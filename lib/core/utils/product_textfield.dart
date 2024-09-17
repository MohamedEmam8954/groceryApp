import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductTextField extends StatelessWidget {
  const ProductTextField({super.key, required this.controller, this.onchanged});
  final TextEditingController controller;
  final void Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      child: TextField(
        controller: controller,
        key: const ValueKey('10 \$'),
        style: const TextStyle(fontSize: 18),
        keyboardType: TextInputType.number,
        maxLines: 1,
        decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        textAlign: TextAlign.center,
        cursorColor: Colors.green,
        enabled: true,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
        ],
        onChanged: onchanged,
      ),
    );
  }
}
