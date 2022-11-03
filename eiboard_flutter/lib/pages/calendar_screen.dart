import 'package:flutter/material.dart';
import '../themes/light_standard_theme.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size; //getting size of screen  need to implement
    return Scaffold(
        backgroundColor: Colors.white, body: SafeArea(child: Center()));
  }
}
