
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:swd_project/utils/app_colors.dart';

class CustomButton extends StatefulWidget {
  final void Function()? onTap;
  final String text;
  final String? icon;
  final Color? customIconColor;
  final bool disactivated;
  const CustomButton(
      {super.key,
      required this.text,
      this.onTap,
      this.disactivated = false,
      this.icon,
      this.customIconColor});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disactivated?0.5:1,
      child: InkWell(
        onTap: () {
          if (widget.disactivated) return;
          FocusScope.of(context).unfocus();
          tapped = false;
          setState(() {});
      
          if (widget.onTap == null) return;
      
          widget.onTap!();
        },
        onTapDown: (details) {
          tapped = true;
          setState(() {});
        },
        onTapCancel: () {
          tapped = false;
          setState(() {});
        },
        child: AnimatedScale(
          scale: tapped ? 0.95 : 1,
          duration: const Duration(milliseconds: 300),
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: double.maxFinite,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                
                gradient: LinearGradient(
                        stops: const [0.6, 1],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColor.gradientPrimaryColor,
                          AppColor.gradientSecondaryColor
                        ],
                      )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  SvgPicture.asset(
                    widget.icon!,
                    colorFilter: ColorFilter.mode(
                        widget.customIconColor ?? Colors.white, BlendMode.srcIn),
                  ),
                  const Gap(10)
                ],
                Text(
                  widget.text,
                  style: Theme.of(context).textTheme.bodyLarge),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
