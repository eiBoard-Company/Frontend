import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/material_color.dart';
import '../../themes/light_standard_theme.dart';

class CustomDatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomDatePicker(
      {super.key, required this.controller, required this.labelText});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final DateFormat _dateFormat = DateFormat('MMMM d, y');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 337,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: LightStandardTheme.colorPrimary, // Set the color to purple
            ),
            child: const Icon(
              Icons.calendar_today_rounded,
              color: Colors.white, // Set the icon color to white
            ),
          ),
          border: const UnderlineInputBorder(),
          labelText: widget.labelText,
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
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
          if (pickedDate != null) {
            String formattedDate = _dateFormat.format(pickedDate);
            setState(() {
              widget.controller.text = formattedDate;
            });
          }
        },
      ),
    );
  }
}
