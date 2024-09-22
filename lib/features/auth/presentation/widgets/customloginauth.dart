import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/core/widgets/customtextformfield.dart';
import 'package:grocery/features/auth/presentation/widgets/forgetPasswordbtn.dart';

class CustomLoginAuth extends StatelessWidget {
  const CustomLoginAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintext: AppStrings.email,
          controller: TextEditingController(),
          maxlines: 1,
          isauth: true,
          oncChanged: (value) {},
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),

        CustomTextFormField(
          hintext: AppStrings.password,
          controller: TextEditingController(),
          maxlines: 1,
          isauth: true,
          oncChanged: (value) {},
          validator: (value) {
            return null;
          },
          suffixicon: Icons.visibility,
        ),
        const SizedBox(
          height: 10,
        ),
        //! forget password
        ForgetPasswordBtn(ontap: () {}),
        const SizedBox(
          height: 35,
        ),
        CustomBtn(
          radius: 2,
          hight: 40,
          ontap: () {},
          title: AppStrings.signIn,
          color: Colors.grey.withOpacity(0.6),
          isBorder: false,
        ),
      ],
    );
  }
}
