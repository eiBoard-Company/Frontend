import 'package:flutter/material.dart';

import '../../themes/light_standard_theme.dart';

class SignUpTextFormField extends StatefulWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const SignUpTextFormField({
    Key? key,
    required this.labelText,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  State<SignUpTextFormField> createState() => _SignUpTextFormFieldState();
}

class _SignUpTextFormFieldState extends State<SignUpTextFormField> {
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
      width: 302,
      height: 69,
      child: TextFormField(
        controller: widget.controller,
        cursorColor: LightStandardTheme.colorPrimary,
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: widget.labelText,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: LightStandardTheme.colorPrimary),
          ),
          labelStyle: TextStyle(
              color: focusNode.hasFocus
                  ? LightStandardTheme.colorPrimary
                  : LightStandardTheme.colorGrey),
          errorStyle: const TextStyle(color: LightStandardTheme.colorError),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: LightStandardTheme.colorError),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: widget.validator,
      ),
    );
  }
}
