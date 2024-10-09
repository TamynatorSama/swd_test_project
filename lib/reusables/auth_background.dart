import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AuthBackground extends StatefulWidget {
  final Widget child;
  const AuthBackground({super.key, required this.child});

  @override
  State<AuthBackground> createState() => _AuthBackgroundState();
}

class _AuthBackgroundState extends State<AuthBackground> {
  Alignment initialToAlignment = Alignment.topRight;

  @override
  initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      initialToAlignment = Alignment.topLeft;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(0, -70),
          child: AnimatedAlign(
            duration: const Duration(seconds: 15),
            // curve: Curves.elasticOut,
            curve: Curves.bounceInOut,
            onEnd: () {
              if (initialToAlignment == Alignment.topLeft) {
                initialToAlignment = Alignment.topRight;
              } else {
                initialToAlignment = Alignment.topLeft;
              }
              if (mounted) {
                setState(() {});
              }
            },
            alignment: initialToAlignment,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        gradient: LinearGradient(
                            stops: [0, 1],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xffEF5858), Color(0xffFFAF65)])),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          gradient: LinearGradient(
                              stops: [0, 1],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0xff776BFF), Color(0xff5FA8FF)])),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          gradient: LinearGradient(
                              stops: [0, 0, 1],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff7FEF58),
                                Color(0xff65FFA3),
                                Color(0xffE3EF58)
                              ])),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 100,
              sigmaY:100,
            ),
            child: widget.child)
      ],
    );
  }
}
