import 'package:flutter/material.dart';

class AppPaddingWrapper extends StatelessWidget {
  final Widget child;
  const AppPaddingWrapper({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (MediaQuery.of(context).size.width * 0.07).clamp(18, 25)),child: child,);
  }
}
