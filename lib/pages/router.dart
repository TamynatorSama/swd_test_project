import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swd_project/pages/dashboard/dashboard.dart';
import 'package:swd_project/utils/navigator_controller.dart';

class RoutingPage extends StatefulWidget {
  const RoutingPage({super.key});

  @override
  State<RoutingPage> createState() => _RoutingPageState();
}

class _RoutingPageState extends State<RoutingPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: navController,
      builder: (context,_) {
        return Scaffold(
          body: const [Dashboard(),Column(),Column(),Column(),Column()][navController.selectedIndex],
          bottomNavigationBar: IntrinsicHeight(
            child: Padding(
                padding: EdgeInsets.only(
                    top: 20, bottom: MediaQuery.paddingOf(context).bottom + 20,right: 20,left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bottomIconBuilder(
                      context,
                        onChange: () => navController.updateIndex(0),
                        isSelected: navController.selectedIndex == 0,
                        text: "Home",
                        defaultIcon: "assets/icons/home.svg"),
                    _bottomIconBuilder(
                      context,
                        onChange: () => navController.updateIndex(1),
                        isSelected: navController.selectedIndex == 1,
                        text: "Services",
                        defaultIcon: "assets/icons/gird.svg"),
                    _bottomIconBuilder(
                      context,
                        onChange: () => navController.updateIndex(2),
                        isSelected: navController.selectedIndex == 2,
                        text: "Statistics",
                        defaultIcon: "assets/icons/stats.svg"),
                    _bottomIconBuilder(
                      context,
                        onChange: () => navController.updateIndex(3),
                        isSelected: navController.selectedIndex == 3,
                        text: "Referrals",
                        defaultIcon: "assets/icons/refer.svg"),
                    _bottomIconBuilder(
                      context,
                        onChange: () => navController.updateIndex(4),
                        isSelected: navController.selectedIndex == 4,
                        text: "Settings",
                        defaultIcon: "assets/icons/gear.svg"),
                  ],
                ),
              ),
          ),
          );
      }
    );
  }
}
Widget _bottomIconBuilder(BuildContext context,{
  bool isSelected = false,
  required String text,
  required String defaultIcon,
  required Function() onChange,
}) =>
    InkWell(
      onTap: onChange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(defaultIcon,colorFilter: ColorFilter.mode(isSelected?Colors.white:const Color(0xff696969), BlendMode.srcIn),),
          Text(text,style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12,color: isSelected?Colors.white:const Color(0xff696969)),)
        ],
      ),
    );
