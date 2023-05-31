import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/material_color.dart';
import '../../themes/light_standard_theme.dart';

class CustomDatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool disabled;
  final DateTime? initialDate;

  const CustomDatePicker({
    Key? key,
    required this.controller,
    required this.labelText,
    this.disabled = false,
    this.initialDate,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final DateFormat _dateFormat = DateFormat('MMMM d, y');
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(_onFocusChange);
    if (widget.initialDate != null) {
      widget.controller.text = _dateFormat.format(widget.initialDate!);
    }
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 337,
      child: TextFormField(
        cursorColor: LightStandardTheme.colorPrimary,
        focusNode: focusNode,
        controller: widget.controller,
        enabled: !widget.disabled,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: LightStandardTheme.colorPrimary),
          ),
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field can not be empty';
          }
          const pattern = r'^[A-Z][a-z]{2,8} \d{1,2}, \d{4}$';
          final regex = RegExp(pattern);
          if (!regex.hasMatch(value)) {
            return 'Use Month Day, Year format (e.g. \'May 22, 2023\')';
          }
          return null;
        },
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
