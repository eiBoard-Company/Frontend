import 'package:eiboard_flutter/pages/calendar_screen.dart';
import 'package:eiboard_flutter/pages/new_Todo_List_Screen.dart';
import 'package:eiboard_flutter/pages/useful_links_sreen.dart';
import 'package:eiboard_flutter/themes/light_standard_theme.dart';
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
          onPressed: () {},
        ),
        buildMenuItem(
          text: 'Tasks',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const NewTodoListScreen();
                },
              ),
            );
          },
        ),
        buildMenuItem(
          text: 'Classes',
          onPressed: () {},
        ),
        buildMenuItem(
          text: 'Schedule',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CalendarScreen();
                },
              ),
            );
          },
        ),
        buildMenuItem(
          text: 'Useful Links',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const UsefulLinksScreen();
                },
              ),
            );
          },
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
          onPressed: () {},
        ),
        buildMenuItem(
          text: 'Logout',
          onPressed: () {},
        ),
      ]),
    );
  }

  //TODO: when email or name too long it overflows, so add a max for signs

  buildHeader(
      {required String profileImage,
      required String name,
      required String email,
      required void Function() onPressed}) {
    return InkWell(
      onTap: () {
        onPressed();
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

  buildMenuItem({required String text, required void Function() onPressed}) {
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
        onPressed();
      },
    );
  }
}
