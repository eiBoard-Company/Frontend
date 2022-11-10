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
        extendBodyBehindAppBar: true,
        backgroundColor: LightStandardTheme.colorMain,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: SafeArea(
            child: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              centerTitle: true,
              title: const Text(
                "Schedule",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black),
              ),
              backgroundColor: LightStandardTheme.colorMain,
            ),
          ),
        ),
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40)),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Column(
                      children: const [
                        SizedBox(height: 20),
                        Text(
                          'October',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 20),
                      ],
                    ))))
          ],
        ))));
  }
}
