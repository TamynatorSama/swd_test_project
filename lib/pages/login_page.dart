import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swd_project/reusables/app_padding_wrapper.dart';
import 'package:swd_project/reusables/auth_background.dart';
import 'package:swd_project/reusables/custom_button.dart';
import 'package:swd_project/reusables/custom_textfield.dart';
import 'package:swd_project/utils/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: AppPaddingWrapper(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),color: AppColor.accentColor),
              ),
              const Gap(24),
              Text("Welcome back 👋🏾",style: Theme.of(context).textTheme.titleLarge,),
              const Gap(72),
              CustomTextfield(
                label: "Email address",
                hintText: "Enter Email address",
              ),
              const Gap(24),
              CustomTextfield(
                label: "Password",
                hintText: "Enter Password",
                isPassword: true,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: (){},
                  visualDensity: VisualDensity.compact,
                  style: const ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsetsDirectional.zero)),
                  icon: Text("Forgot password?",style: Theme.of(context).textTheme.bodyMedium,)),
              ),
              const Gap(32),
              const CustomButton(text: "Sign in")
            ],
          ),
        ),
      ),
    );
  }
}
