import 'package:eiboard_flutter/themes/light_standard_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: LightStandardTheme.colorMain,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        color: Colors.black,
        iconSize: 28.0,
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person_rounded),
          color: Colors.black,
          iconSize: 28.0,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
