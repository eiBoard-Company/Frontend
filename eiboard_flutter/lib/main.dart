import 'package:eiboard_flutter/pages/open_screen.dart';
import 'package:eiboard_flutter/pages/settings_pages/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const EiBoard());
}

class EiBoard extends StatelessWidget {
  const EiBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.karlaTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const OpenScreen(),
    );
  }
}
