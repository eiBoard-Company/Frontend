import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/open_screen.dart';

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
