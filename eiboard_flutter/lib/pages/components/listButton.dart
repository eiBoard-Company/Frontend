import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/light_standard_theme.dart';

class Listbutton extends StatelessWidget {
  final String taskname;
  final VoidCallback function;
  final Color colorback;
  final String course;
  final String date;
  const Listbutton(
      this.taskname, this.function, this.colorback, this.course, this.date,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Material(
        child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(337, 58),
              backgroundColor: colorback,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: LightStandardTheme.colorLightFont)),
          child: Column(
            children: [
              Text(
                taskname,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: LightStandardTheme.colorLightFont),
                ),
              ),
              Text(
                course,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: LightStandardTheme.colorSubjectName),
                ),
              ),
              Text(
                date,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: LightStandardTheme.colorSubjectName),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
