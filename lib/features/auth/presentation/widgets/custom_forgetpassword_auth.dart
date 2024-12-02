import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/core/utils/app_strings.dart';
import 'package:grocery/core/widgets/customBtn.dart';
import 'package:grocery/core/widgets/customtextformfield.dart';
import 'package:grocery/features/auth/presentation/manager/cubit/auth_cubit_cubit.dart';

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
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var authCubit = context.read<AuthCubit>();
    return Form(
      key: globalkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            controller: email,
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
                authCubit.forgetPassword(
                    email: email.text.toLowerCase().trim());
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
