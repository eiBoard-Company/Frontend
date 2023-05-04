import 'package:eiboard_flutter/pages/components/todo_list_box.dart';
import 'package:eiboard_flutter/themes/light_standard_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoBoxMainScreen extends StatelessWidget {
  final String textInCardTop;
  final TodoListBox todo;

  const TodoBoxMainScreen({
    Key? key,
    required this.textInCardTop,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 208,
      height: 259,
      child: Card(
        color: Colors.white,
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 5.0),
              Text(
                textInCardTop,
                style: GoogleFonts.karla(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: LightStandardTheme.colorSecondary),
              ),
              const Divider(
                color: LightStandardTheme.colorLines,
              ),
              const SizedBox(
                height: 5.0,
              ),
              todo,
            ],
          ),
        )),
      ),
    );
  }
}
