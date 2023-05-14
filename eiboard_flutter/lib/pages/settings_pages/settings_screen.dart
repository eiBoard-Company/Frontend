import '/../pages/components/page.dart';
import '/../pages/main_screen.dart';
import '/../themes/light_standard_theme.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageBackground(
          topic: 'Settings',
          showPlusIcon: false,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  buildText(
                    context: context,
                    text: 'My Account',
                    description: 'Manage your Account',
                    page: const MainScreen(),
                  ),
                  const SizedBox(height: 25),
                  buildText(
                    context: context,
                    text: 'How to eiBoard',
                    description: 'Have a look at the FAQs',
                    page: const MainScreen(),
                  ),
                  const SizedBox(height: 25),
                  buildText(
                    context: context,
                    text: 'About us',
                    description: 'Our mission and contact',
                    page: const MainScreen(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: LightStandardTheme.colorLines,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  'images/logoEiBoard.png',
                  width: 52,
                  height: 36,
                ),
              ),
              const SizedBox(width: 8),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'App Version',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '1.0',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildText({
    required BuildContext context,
    required String text,
    required String description,
    required Widget page,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return page;
            },
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
