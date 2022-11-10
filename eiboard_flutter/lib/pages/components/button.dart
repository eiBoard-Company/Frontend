import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/light_standard_theme.dart';

class Button extends StatelessWidget {
  final String texxt;
  final VoidCallback function;
  const Button(this.texxt, this.function, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Material(
        child: ElevatedButton(
          onPressed: function,
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
            texxt,
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
