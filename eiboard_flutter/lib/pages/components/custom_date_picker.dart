import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/material_color.dart';
import '../../themes/light_standard_theme.dart';

class CustomDatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool disabled; // Neue Variable zur Bestimmung des Bearbeitungszustands
  final DateTime? initialDate; // Optionaler initialer Wert

  const CustomDatePicker({
    Key? key,
    required this.controller,
    required this.labelText,
    this.disabled = false, // Standardwert auf false setze
    this.initialDate,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final DateFormat _dateFormat = DateFormat('MMMM d, y');

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      // Initialen Wert im TextEditingController setzen
      widget.controller.text = _dateFormat.format(widget.initialDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 337,
      child: TextFormField(
        controller: widget.controller,
        enabled: !widget.disabled,
        decoration: InputDecoration(
          suffixIcon: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: LightStandardTheme.colorPrimary,
            ),
            child: const Icon(
              Icons.calendar_today_rounded,
              color: Colors.white,
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
