import 'package:flutter/material.dart';

import '../../model/material_color.dart';
import '../../themes/light_standard_theme.dart';

class CustomTimePicker extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final double width;

  const CustomTimePicker(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.width});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: widget.labelText,
        ),
        onTap: () async {
          TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (context, child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.fromSwatch(
                    primarySwatch:
                        getMaterialColor(LightStandardTheme.colorPrimary),
                  ),
                  dialogBackgroundColor: Colors.white,
                ),
                child: child!,
              );
            },
          );
          if (pickedTime != null) {
            String formattedTime = formatTimeOfDay(pickedTime);
            setState(() {
              widget.controller.text = formattedTime;
            });
          }
        },
      ),
    );
  }

  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(timeOfDay);
  }
}
