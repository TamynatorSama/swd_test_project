import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:swd_project/reusables/app_padding_wrapper.dart';
import 'package:swd_project/reusables/auth_background.dart';
import 'package:swd_project/reusables/custom_button.dart';
import 'package:swd_project/reusables/expandable_scrollable_widget.dart';
import 'package:swd_project/pages/router.dart';
import 'package:swd_project/utils/app_colors.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: AppPaddingWrapper(
      child: ExpandableScrollableWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(MediaQuery.paddingOf(context).top + 20),
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
                const Gap(8),
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
          const Gap(56),
          Text(
            "Verify your email",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(16),
          Text.rich(TextSpan(
              children: [
                const TextSpan(text: "Please enter the OTP sent to \n"),
                TextSpan(
                    text: "tolu.ab19@gmail.com",
                    style: Theme.of(context).textTheme.displayLarge)
              ],
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColor.textColor2))),
          const Gap(32),
          Align(
            alignment: Alignment.center,
            child: Pinput(
              validator: (value) {
                if ((value ?? "").isEmpty || (value ?? "").length < 4) {
                  return "";
                }
                return null;
              },
              onCompleted: (value) {},
              // controller: controller,
              length:6,
              separatorBuilder: (index) => index == 2
                  ? Text(
                      " - ",
                      style: Theme.of(context).textTheme.displayLarge,
                    )
                  : index ==5? const SizedBox.shrink():const Gap(8),
              errorTextStyle: const TextStyle(fontSize: 0),
              defaultPinTheme: PinTheme(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  width: (MediaQuery.of(context).size.width /6.5) - 8,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.accentColor,
                      border: Border.all(width: 1, color: AppColor.borderColor))),
              focusedPinTheme: PinTheme(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  width: (MediaQuery.of(context).size.width /6.5) - (10*6),
                  height: 52,
                  decoration: BoxDecoration(
                      color: AppColor.accentColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: AppColor.borderColor))),
              errorPinTheme: PinTheme(
                  width: 46,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 1, color: AppColor.gradientPrimaryColor))),
            ),
          ),
          const Spacer(),
          const Gap(27),
          CustomButton(text: "Verify email",onTap: () => Navigator.pushAndRemoveUntil(context, PageTransition(
                                  child: const RoutingPage(),
                                  type: PageTransitionType.rightToLeft), (_)=>false),),
          const Gap(27),
          Row(
            children: [
              Expanded(
                  child: Container(
                width: double.maxFinite,
                height: 3,
                decoration: ShapeDecoration(
                    shape: const StadiumBorder(), color: AppColor.whiteColor),
              )),
              const Gap(8),
              Expanded(
                  child: Container(
                width: double.maxFinite,
                height: 3,
                decoration: ShapeDecoration(
                    shape: const StadiumBorder(), color: AppColor.whiteColor
                    ),
              ))
            ],
          ),
          const Gap(15),
          Align(
              alignment: Alignment.center,
              child: Text(
                "Email verification",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColor.textColor2),
              )),
          Gap(MediaQuery.paddingOf(context).top),
        ],
      )),
    )));
  }
}
