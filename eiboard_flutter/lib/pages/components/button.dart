import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/light_standard_theme.dart';

class Button extends StatelessWidget {
  final String textInButton;
  final VoidCallback functionOfOnPressed;
  const Button(this.textInButton, this.functionOfOnPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Material(
        child: ElevatedButton(
          onPressed: functionOfOnPressed,
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(302, 69),
              backgroundColor: LightStandardTheme.colorPrimary,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(70),
                ),
              ),
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          child: Text(
            textInButton,
            style: GoogleFonts.montserrat(
              textStyle:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
