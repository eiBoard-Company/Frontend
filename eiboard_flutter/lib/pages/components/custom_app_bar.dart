import '../settings_pages/account_screen.dart';
import '/../themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.context}) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: LightStandardTheme.colorMain,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        color: Colors.black,
        iconSize: 28.0,
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person_rounded),
          color: Colors.black,
          iconSize: 28.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const AccountScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
