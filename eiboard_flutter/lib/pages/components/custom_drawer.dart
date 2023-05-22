import '/../pages/main_screen.dart';
import '/../pages/menu_screen.dart';
import '/../themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: const MenuScreen(),
      mainScreen: const MainScreen(),
      borderRadius: 10,
      angle: 0.0,
      showShadow: true,
      style: DrawerStyle.defaultStyle,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      menuBackgroundColor: LightStandardTheme.colorMain,
    );
  }
}
