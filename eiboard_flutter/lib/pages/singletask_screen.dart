import 'package:date_field/date_field.dart';
import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/light_standard_theme.dart';

class SingleTaskScreen extends StatefulWidget {
  const SingleTaskScreen({super.key});

  @override
  State<SingleTaskScreen> createState() => _SingleTaskScreen();
}

class _SingleTaskScreen extends State<SingleTaskScreen> {
  bool bearbeitet = false;
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return PageBackground(
        topic: 'Task',
        showPlusIcon: false,
        child: Center(
            child: Container(
          width: 337,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // hier hinzugefügt
              crossAxisAlignment: CrossAxisAlignment.start, // hier hinzugefügt
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Matheaufgaben erledigen',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: LightStandardTheme.colorLightFont,
                          fontSize: 24,
                          fontWeight: FontWeight.w600)),
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      'Mathematik II',
                      style: TextStyle(
                          color: LightStandardTheme.colorLightFont,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DateTimeFormField(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                              color: LightStandardTheme.colorLightFont,
                              fontSize: 12),
                          errorStyle: TextStyle(
                              color: LightStandardTheme.colorError,
                              fontSize: 12),
                        ),
                        mode: DateTimeFieldPickerMode.time,
                        autovalidateMode: AutovalidateMode.always,
                        enabled: bearbeitet,
                        initialValue: DateTime.now(),
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null,
                        onDateSelected: (DateTime value) {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Due this Week',
                      style: TextStyle(
                        color: LightStandardTheme.colorDueThisWeek,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                    controller: TextEditingController()
                      ..text = 'Your initial value',
                    onChanged: (text) => {},
                    decoration: InputDecoration(
                      enabled: bearbeitet,
                    )),
                const SizedBox(height: 20),
                Text('${sliderValue.toStringAsFixed(0)}% completet'),
                Slider(
                  value: sliderValue,
                  min: 0.0,
                  max: 100.0,
                  label: sliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  activeColor: LightStandardTheme.colorSecondary,
                  inactiveColor: LightStandardTheme.colorPrimary,
                ),
              ]),
        )));
  }
}
