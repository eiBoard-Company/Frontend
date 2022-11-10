import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:flutter/material.dart';
import '../themes/light_standard_theme.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
        topic: 'Schedule',
        child: Center(
            child: Column(
          children: const [
            SizedBox(height: 20),
            Text(
              'October',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20),
          ],
        )));
  }
}
