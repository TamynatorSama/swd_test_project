import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:swd_project/utils/app_colors.dart';

class DashboardButtons extends StatefulWidget {
  final String icon;
  final String text;
  final Function()? onTap;
  const DashboardButtons(
      {super.key, required this.icon, required this.text, this.onTap});

  @override
  State<DashboardButtons> createState() => _DashboardButtonsState();
}

class _DashboardButtonsState extends State<DashboardButtons> {
  double scaleValue = 0.5;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: Random().nextInt(200) + 50),(){
        scaleValue = 1;
         setState(() {});
      });
     
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: scaleValue,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutQuart,
      child: InkWell(
        onTap: widget.onTap,
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
                widget.icon,
                width: 27,
              ),
              const Gap(2),
              Text(
                widget.text,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
