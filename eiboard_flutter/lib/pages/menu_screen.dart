import '/../pages/settings_pages/account_screen.dart';
import '/../pages/calendar_screen.dart';
import 'todo_list_screen.dart';
import '/../pages/open_screen.dart';
import '/../pages/settings_pages/settings_screen.dart';
import '/../pages/useful_links_sreen.dart';
import '/../themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    const name = 'Matteo Staar';
    const email = 'matteo.staar@ei.com';
    const profileImage = 'images/logoEiBoard.png';

    return Scaffold(
      backgroundColor: LightStandardTheme.colorMain,
      body: ListView(padding: const EdgeInsets.only(left: 15), children: [
        const SizedBox(height: 50),
        buildHeader(
          profileImage: profileImage,
          name: name,
          email: email,
          page: const AccountScreen(),
        ),
        buildMenuItem(
          text: 'Tasks',
          page: TodoListScreen(),
        ),
        buildMenuItem(
          text: 'Schedule',
          page: const CalendarScreen(),
        ),
        buildMenuItem(
          text: 'Useful Links',
          page: const UsefulLinksScreen(),
        ),
        const SizedBox(
          height: 12,
        ),
        const Divider(
          color: Colors.white,
        ),
        const SizedBox(
          height: 12,
        ),
        buildMenuItem(
          text: 'Settings',
          page: const SettingsScreen(),
        ),
        buildMenuItem(
          text: 'Logout',
          page: const OpenScreen(),
        ),
      ]),
    );
  }

  //TODO: when email or name too long it overflows, so add a max for signs

  buildHeader(
      {required String profileImage,
      required String name,
      required String email,
      required Widget page}) {
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
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(profileImage),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    email,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  buildMenuItem({required String text, required Widget page}) {
    return ListTile(
      leading: Text(
        text,
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      hoverColor: Colors.white,
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
    );
  }
}
