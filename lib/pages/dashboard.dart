import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:swd_project/reusables/app_padding_wrapper.dart';
import 'package:swd_project/pages/dashboard/widgets/dashboard_buttons.dart';
import 'package:swd_project/reusables/gradient_text.dart';
import 'package:swd_project/utils/app_colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 55,
        height: 55,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(shape: const CircleBorder(),gradient: LinearGradient(
          stops: const [0.5,1],
          colors: [AppColor.gradientPrimaryColor,AppColor.gradientSecondaryColor])),
        child: SvgPicture.asset("assets/icons/chat.svg"),
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            decoration: ShapeDecoration(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24))),
                color: AppColor.whiteColor),
            child: AppPaddingWrapper(
                child: Column(
              children: [
                Gap(MediaQuery.paddingOf(context).top + 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/user.svg"),
                    Text(
                      "Welcome, Sam 👋🏾",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    SvgPicture.asset("assets/icons/Notification.svg")
                  ],
                ),
                const Gap(24),
                _buildAccountInfo(context, amount: "50,000"),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTopActions(context,
                        icon: "assets/icons/Plus.svg", text: "Top up"),
                    Container(
                      width: 2,
                      color: const Color(0xffD6D6D6),
                      height: 20,
                    ),
                    _buildTopActions(context,
                        icon: "assets/icons/Send.svg", text: "Transfer"),
                    Container(
                      width: 2,
                      color: const Color(0xffD6D6D6),
                      height: 20,
                    ),
                    _buildTopActions(context,
                        icon: "assets/icons/clock.svg", text: "History"),
                  ],
                ),
                const Gap(27),
                Container(
                  width: 48,
                  decoration: const ShapeDecoration(
                      shape: StadiumBorder(), color: const Color(0xffE9E9E9)),
                  height: 5,
                ),
                const Gap(14),
              ],
            )),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.only(top: 32),
            children: [
              AppPaddingWrapper(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quick Actions",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const Gap(15),
                    GridView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 75,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 4),
                      children: const [
                         DashboardButtons(
                            icon: "assets/icons/data-saver.svg", text: "Data"),
                         DashboardButtons(
                            icon: "assets/icons/bi_credit-card.svg",
                            text: "Airtime"),
                         DashboardButtons(
                            icon: "assets/icons/show.svg", text: "Showmax"),
                         DashboardButtons(
                            icon: "assets/icons/card.svg", text: "Giftcards"),
                         DashboardButtons(
                            icon: "assets/icons/casino-chips.svg",
                            text: "Betting"),
                         DashboardButtons(
                            icon: "assets/icons/energy.svg",
                            text: "Electricity"),
                         DashboardButtons(
                            icon: "assets/icons/cable.svg", text: "TV/Cable"),
                         DashboardButtons(
                            icon: "assets/icons/e-pin.svg", text: "E-pin"),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(42),
              AppPaddingWrapper(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "News & Update",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    IconButton(
                        onPressed: () {},
                        visualDensity: VisualDensity.compact,
                        icon: Text(
                          "View all",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(color: AppColor.gradientPrimaryColor),
                        ))
                  ],
                ),
              ),
              const Gap(15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Wrap(
                  spacing: 16,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/images/image.jpg",
                          fit: BoxFit.cover,
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 120,
                        )),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/images/image.jpg",
                          fit: BoxFit.cover,
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 120,
                        ))
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

Widget _quickActions(BuildContext context,
        {required String icon, required String text, Function()? onTap}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: AppColor.accentColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 27,
            ),
            const Gap(2),
            Text(
              text,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 14,
                  ),
            )
          ],
        ),
      ),
    );

Widget _buildTopActions(BuildContext context,
        {required String icon, required String text, Function()? onTap}) =>
    InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
          ),
          const Gap(8),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 14, color: AppColor.accentColor),
          )
        ],
      ),
    );

Widget _buildAccountInfo(BuildContext context,
        {required String amount, bool isShowing = true, Function()? change}) =>
    Container(
      padding: const EdgeInsets.all(15),
      decoration: ShapeDecoration(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
          gradient: LinearGradient(
              stops: const [0.4, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColor.gradientPrimaryColor,
                AppColor.gradientSecondaryColor
              ])),
      child: Row(
        children: [
          Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WALLET BALANCE",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 10),
                  ),
                  const Gap(6),
                  Row(
                    children: [
                      Text(
                        "NGN ${isShowing ? amount : "****"}",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        isShowing
                            ? "assets/icons/eye-hide.svg"
                            : "assets/icons/eye_open.svg",
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                        width: 20,
                      )
                    ],
                  ),
                  const Gap(10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        color: Colors.white.withOpacity(0.6)),
                    child: IntrinsicWidth(
                      child: Row(
                        children: [
                          Text(
                            "Cashback",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 10, color: Colors.black),
                          ),
                          const Gap(5),
                          GradientText("N341.20",
                              gradient: LinearGradient(
                                colors: [
                                  AppColor.gradientPrimaryColor,
                                  AppColor.gradientSecondaryColor
                                ],
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  )
                ],
              )),
          const Spacer(),
          Container(
            width: 2,
            color: const Color.fromRGBO(208, 78, 78, .6),
            height: 80,
          ),
          const Spacer(),
          Expanded(
            flex: 10,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24))),
                  color: Colors.white.withOpacity(0.6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MONIEPOINT",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 10),
                  ),
                  const Gap(6),
                  Row(
                    children: [
                      Text(
                        "8192017482",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        "assets/icons/copy.svg",
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                        width: 20,
                      )
                    ],
                  ),
                  const Gap(10),
                  Text(
                    "Deposit Fee: N20",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
