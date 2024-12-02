import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/app/groceryapp.dart';
import 'package:grocery/core/function/navigationApp.dart';
import 'package:grocery/core/utils/app_router.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/core/widgets/customtextformfield.dart';
import 'package:grocery/features/auth/presentation/manager/cubit/auth_cubit_cubit.dart';
import 'package:grocery/features/auth/presentation/widgets/forgetPasswordbtn.dart';

class CustomLoginAuth extends StatefulWidget {
  const CustomLoginAuth({super.key});

  @override
  State<CustomLoginAuth> createState() => _CustomLoginAuthState();
}

class _CustomLoginAuthState extends State<CustomLoginAuth> {
  var globalkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isvisable = false;
  var fristfocusNode = FocusNode();
  var secondfocusNode = FocusNode();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var authCubit = context.read<AuthCubit>();
    return Form(
      key: globalkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailEditingController,
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
            height: 20,
          ),
          CustomTextFormField(
            controller: passwordEditingController,
            focusNode: secondfocusNode,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            hintext: AppStrings.password,
            obscureText: !isvisable ? true : false,
            maxlines: 1,
            isauth: true,
            oncChanged: (value) {},
            validator: (value) {
              if (value!.isEmpty) {
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
                authCubit.signIn(
                    email: emailEditingController.text.toLowerCase().trim(),
                    password: passwordEditingController.text);
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
