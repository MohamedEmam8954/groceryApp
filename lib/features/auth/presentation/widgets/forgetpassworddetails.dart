import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/utils/app_styles.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/core/widgets/customtextformfield.dart';

class ForgetPasswordDetails extends StatelessWidget {
  const ForgetPasswordDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Text(
            AppStrings.forgetPassword,
            style: AppStyles.style28.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          const CustomForgetPasswordAuth(),
        ],
      ),
    );
  }
}

class CustomForgetPasswordAuth extends StatefulWidget {
  const CustomForgetPasswordAuth({super.key});

  @override
  State<CustomForgetPasswordAuth> createState() =>
      _CustomForgetPasswordAuthState();
}

class _CustomForgetPasswordAuthState extends State<CustomForgetPasswordAuth> {
  var globalkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isvisable = false;
  var fristfocusNode = FocusNode();
  var secondfocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            focusNode: fristfocusNode,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
            hintext: AppStrings.email,
            oneditingcomplete: () =>
                FocusScope.of(context).requestFocus(secondfocusNode),
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
            height: 30,
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
            title: AppStrings.signIn,
            color: Colors.grey.withOpacity(0.6),
            isBorder: false,
          ),
        ],
      ),
    );
  }
}
