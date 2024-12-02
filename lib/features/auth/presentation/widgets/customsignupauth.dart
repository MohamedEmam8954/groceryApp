import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/function/navigationApp.dart';

import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/core/widgets/customtextformfield.dart';
import 'package:grocery/features/auth/presentation/manager/cubit/auth_cubit_cubit.dart';
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
  var fristfocusNode = FocusNode();
  var secondfocusNode = FocusNode();
  var thirdfocusNode = FocusNode();
  var forthfocusNode = FocusNode();
  TextEditingController emaileditingcontroller = TextEditingController();
  TextEditingController passwordeditingcontroller = TextEditingController();
  TextEditingController nameeditingcontroller = TextEditingController();
  TextEditingController addresseditingcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authCubit = context.read<AuthCubit>();
    return Form(
      key: globalkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            controller: nameeditingcontroller,
            focusNode: fristfocusNode,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.name,
            hintext: AppStrings.fullname,
            oneditingcomplete: () =>
                FocusScope.of(context).requestFocus(secondfocusNode),
            maxlines: 1,
            isauth: true,
            oncChanged: (value) {},
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.thisfieldismissing;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            controller: emaileditingcontroller,
            focusNode: secondfocusNode,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
            hintext: AppStrings.email,
            oneditingcomplete: () =>
                FocusScope.of(context).requestFocus(thirdfocusNode),
            maxlines: 1,
            isauth: true,
            oncChanged: (value) {},
            validator: (value) {
              if (value!.isEmpty ||
                  !value.contains('@') ||
                  !value.contains('com')) {
                return AppStrings.enterValidEmailAddress;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),

          CustomTextFormField(
            controller: passwordeditingcontroller,
            focusNode: thirdfocusNode,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.visiblePassword,
            hintext: AppStrings.password,
            obscureText: !isvisable ? true : false,
            oneditingcomplete: () =>
                FocusScope.of(context).requestFocus(forthfocusNode),
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
            controller: addresseditingcontroller,
            focusNode: forthfocusNode,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.streetAddress,
            hintext: AppStrings.shippingAddress,
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
          ForgetPasswordBtn(
            ontap: () {
              navTo(context, AppRouter.forgetpassword);
            },
          ),
          const SizedBox(
            height: 35,
          ),
          CustomBtn(
            radius: 2,
            hight: 40,
            ontap: () {
              FocusScope.of(context).unfocus();
              if (globalkey.currentState!.validate()) {
                authCubit.signUp(
                  email: emaileditingcontroller.text.toLowerCase().trim(),
                  password: passwordeditingcontroller.text.trim(),
                  name: nameeditingcontroller.text,
                  address: addresseditingcontroller.text,
                  createdas: Timestamp.now(),
                );
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
