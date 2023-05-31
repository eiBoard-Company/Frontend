import 'package:flutter/material.dart';

import '../../themes/light_standard_theme.dart';

class EMailInputField extends StatefulWidget {
  const EMailInputField({Key? key}) : super(key: key);

  @override
  State<EMailInputField> createState() => _EMailInputFieldState();
}

class _EMailInputFieldState extends State<EMailInputField> {
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
        cursorColor: LightStandardTheme.colorPrimary,
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: "Enter E-Mail",
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field can not be empty';
          }
          final emailRegex = RegExp(
              r'^[\w-]+(\.[\w-]+)*@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*\.[a-zA-Z\d]{2,}$');
          if (!emailRegex.hasMatch(value)) {
            return 'Invalid email format';
          }
          return null;
        },
      ),
    );
  }
}
