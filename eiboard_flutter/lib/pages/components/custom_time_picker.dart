import 'package:flutter/material.dart';

import '../../model/material_color.dart';
import '../../themes/light_standard_theme.dart';

class CustomTimePicker extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final double width;
  final String? Function(String?)? validator;

  const CustomTimePicker(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.width,
      this.validator});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        cursorColor: LightStandardTheme.colorPrimary,
        focusNode: focusNode,
        controller: widget.controller,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: LightStandardTheme.colorPrimary),
          ),
          labelStyle: TextStyle(
              color: focusNode.hasFocus
                  ? LightStandardTheme.colorPrimary
                  : LightStandardTheme.colorGrey),
          errorStyle: const TextStyle(color: LightStandardTheme.colorError),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: LightStandardTheme.colorError),
          ),
          labelText: widget.labelText,
        ),
        validator: widget.validator,
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
