import 'package:flutter/material.dart';

import '../../themes/light_standard_theme.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String? initialValue;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    Key? key,
    required this.labelText,
    this.initialValue,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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
      width: 337,
      child: TextFormField(
          cursorColor: LightStandardTheme.colorPrimary,
          focusNode: focusNode,
          initialValue: widget.initialValue,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: LightStandardTheme.colorPrimary),
            ),
            labelText: widget.labelText,
            labelStyle: TextStyle(
                color: focusNode.hasFocus
                    ? LightStandardTheme.colorPrimary
                    : LightStandardTheme.colorGrey),
            errorStyle: const TextStyle(color: LightStandardTheme.colorError),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: LightStandardTheme.colorError),
            ),
          ),
          validator: widget.validator),
    );
  }
}
