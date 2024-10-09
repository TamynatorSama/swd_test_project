import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swd_project/reusables/app_padding_wrapper.dart';
import 'package:swd_project/reusables/auth_background.dart';
import 'package:swd_project/reusables/custom_button.dart';
import 'package:swd_project/reusables/custom_textfield.dart';
import 'package:swd_project/reusables/gradient_text.dart';
import 'package:swd_project/utils/app_colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: AppPaddingWrapper(
          child: Column(
            children: [
              Gap(MediaQuery.paddingOf(context).top + 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColor.textColor2,
                        ),
                        Text(
                          "Back",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColor.textColor2),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: GradientText(
                        "Sign in instead",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(decoration: TextDecoration.underline),
                        gradient: LinearGradient(colors: [
                          AppColor.gradientPrimaryColor,
                          AppColor.gradientSecondaryColor
                        ]),
                      ))
                ],
              ),
              const Gap(25),
              Text(
                "Create an account",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(25),
              Expanded(
                  child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  const Row(
                    children: [
                      Expanded(
                          child: CustomTextfield(
                        label: "First name",
                        hintText: "First name",
                      )),
                      Gap(10),
                      Expanded(
                          child: CustomTextfield(
                        label: "Last name",
                        hintText: "Last name",
                      )),
                    ],
                  ),
                  const Gap(24),
                  const CustomTextfield(
                    label: "Phone number",
                    hintText: "Enter phone number",
                  ),
                  const Gap(24),
                  const CustomTextfield(
                    label: "Email address",
                    hintText: "Enter Email address",
                  ),
                  const Gap(24),
                  const CustomTextfield(
                    label: "Create Password",
                    isPassword: true,
                    hintText: "Enter Password",
                  ),
                  const Gap(24),
                  CustomTextfield(
                    label: "Referral Code (Optional)",
                    isPassword: true,
                    hintText: "Enter Referral Code",
                    validator: (_) => null,
                  ),
                  const Gap(27),
                  const CustomButton(text: "Next"),
                  const Gap(27),
                  Row(
                    children: [
                      Expanded(child: 
                      Container(
                        width: double.maxFinite,
                        height: 3,
                        decoration: ShapeDecoration(shape: const StadiumBorder(),color: AppColor.whiteColor),
                      )),
                      const Gap(8),
                      Expanded(child: 
                      Container(
                        width: double.maxFinite,
                        height: 3,
                        decoration: ShapeDecoration(shape: const StadiumBorder(),color: AppColor.accentColor),
                      ))
                    ],
                  ),
                  const Gap(15),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Account information",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColor.textColor2),))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
