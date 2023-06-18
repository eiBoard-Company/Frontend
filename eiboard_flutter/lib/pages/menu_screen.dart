import 'package:provider/provider.dart';

import '../model/user.dart';
import 'dart:convert';
import '../utils/auth_provider.dart';
import '/../pages/settings_pages/account_screen.dart';
import '/../pages/calendar_screen.dart';
import 'components/backend_rapla.dart';
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
  User? user;

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final String? userID = authProvider.userID;
    final String? bearerToken = authProvider.bearerToken;

    if (userID != null && bearerToken != null) {
      HttpRequest.getUser(userID, bearerToken, context).then((retrievedUser) {
        setState(() {
          user = retrievedUser;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightStandardTheme.colorMain,
      body: ListView(padding: const EdgeInsets.only(left: 15), children: [
        const SizedBox(height: 50),
        buildHeader(
          profileImage: user!.imagePath,
          name: "${user!.firstName} ${user!.lastName}",
          email: user!.email!,
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

  buildHeader(
      {required String? profileImage,
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
                backgroundColor: Colors.white,
                backgroundImage: user!.imagePath != null
                    ? MemoryImage(
                        base64Decode(user!.imagePath!),
                      )
                    : Image.asset('images/profilePicture.jpg').image,
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ))
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
