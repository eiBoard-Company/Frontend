import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../themes/light_standard_theme.dart';

class TodoListBox extends StatelessWidget {
  final String taskname;
  final String classname;
  final String date;
  final Color color;
  final double width;
  final double height;
  final double fontSizeTitleOfTodo;
  final double fontSizeCategoryOfTodo;
  final bool showDueDateOfTodo;
  final void Function() onPressed;

  const TodoListBox(
      this.taskname, this.classname, this.date, this.color, this.onPressed,
      {this.width = 337,
      this.height = 58,
      this.fontSizeTitleOfTodo = 14,
      this.fontSizeCategoryOfTodo = 10,
      this.showDueDateOfTodo = true,
      Key? key})
      : super(key: key);

  const TodoListBox.withSize(
      this.taskname,
      this.classname,
      this.date,
      this.color,
      this.width,
      this.height,
      this.fontSizeTitleOfTodo,
      this.fontSizeCategoryOfTodo,
      this.showDueDateOfTodo,
      this.onPressed,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            onPressed();
          },
          child: Container(
            color: color,
            width: width,
            height: height,
            padding: const EdgeInsets.all(15.0),
            child: Center(
                child: Stack(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(taskname,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: fontSizeTitleOfTodo,
                              fontWeight: FontWeight.w700,
                              color: LightStandardTheme.colorLightFont),
                        ))),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(classname,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: fontSizeCategoryOfTodo,
                              fontWeight: FontWeight.w700,
                              color: LightStandardTheme.colorSubjectName),
                        ))),
                if (showDueDateOfTodo)
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(date,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: fontSizeCategoryOfTodo,
                                fontWeight: FontWeight.w700,
                                color: LightStandardTheme.colorSubjectName),
                          )))
              ],
            )),
          ),
        ));
  }
}
