import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../themes/light_standard_theme.dart';

class TodoListBox extends StatelessWidget {
  final String taskname;
  final String classname;
  final String date;
  final Color color;
  const TodoListBox(this.taskname, this.classname, this.date, this.color,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: color,
        width: 337,
        height: 58,
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Stack(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(taskname,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: LightStandardTheme.colorLightFont),
                    ))),
            Align(
                alignment: Alignment.bottomLeft,
                child: Text(classname,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: LightStandardTheme.colorSubjectName),
                    ))),
            Align(
                alignment: Alignment.topRight,
                child: Text(date,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: LightStandardTheme.colorSubjectName),
                    )))
          ],
        )),
      ),
    );
  }
}
