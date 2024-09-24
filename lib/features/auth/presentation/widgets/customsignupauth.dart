import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/core/widgets/customtextformfield.dart';
import 'package:grocery/features/auth/presentation/widgets/forgetPasswordbtn.dart';

class CustomSignUPAuth extends StatefulWidget {
  const CustomSignUPAuth({super.key});

  @override
  State<CustomSignUPAuth> createState() => _CustomSignUPAuthState();
}

class _CustomSignUPAuthState extends State<CustomSignUPAuth> {
  var globalkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isvisable = false;
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.name,
            hintext: AppStrings.fullname,
            oneditingcomplete: () =>
                FocusScope.of(context).requestFocus(focusNode),
            maxlines: 1,
            isauth: true,
            oncChanged: (value) {},
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.enterValidname;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
            hintext: AppStrings.email,
            oneditingcomplete: () =>
                FocusScope.of(context).requestFocus(focusNode),
            maxlines: 1,
            isauth: true,
            oncChanged: (value) {},
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return AppStrings.enterValidEmailAddress;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),

          CustomTextFormField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.visiblePassword,
            hintext: AppStrings.password,
            obscureText: !isvisable ? true : false,
            oneditingcomplete: () =>
                FocusScope.of(context).requestFocus(focusNode),
            maxlines: 1,
            isauth: true,
            oncChanged: (value) {},
            validator: (value) {
              if (value!.isEmpty || value.length < 7) {
                return AppStrings.enterValidPassword;
              }
              return null;
            },
            suffixicon: isvisable ? Icons.visibility : Icons.visibility_off,
            onTapSuffixicon: () {
              setState(() {
                isvisable = !isvisable;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.streetAddress,
            hintext: AppStrings.shippingAddress,
            oneditingcomplete: () =>
                FocusScope.of(context).requestFocus(focusNode),
            maxlines: 1,
            isauth: true,
            oncChanged: (value) {},
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.enterValidshippingaddress;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          //! forget password
          ForgetPasswordBtn(ontap: () {}),
          const SizedBox(
            height: 35,
          ),
          CustomBtn(
            radius: 2,
            hight: 40,
            ontap: () {
              FocusScope.of(context).unfocus();
              if (globalkey.currentState!.validate()) {
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            title: AppStrings.signup,
            color: Colors.grey.withOpacity(0.6),
            isBorder: false,
          ),
        ],
      ),
    );
  }
}
