import 'package:flutter/material.dart';

import '../../themes/light_standard_theme.dart';

class LoginPasswordInputField extends StatefulWidget {
  final TextEditingController? controller;
  const LoginPasswordInputField({Key? key, this.controller}) : super(key: key);

  @override
  State<LoginPasswordInputField> createState() =>
      _LoginPasswordInputFieldState();
}

class _LoginPasswordInputFieldState extends State<LoginPasswordInputField> {
  FocusNode focusNode = FocusNode();
  bool showPassword = false;
  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 302,
        height: 69,
        child: TextFormField(
          cursorColor: LightStandardTheme.colorPrimary,
          focusNode: focusNode,
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: 'Enter Password',
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
              borderSide:
                  const BorderSide(color: LightStandardTheme.colorError),
            ),
            suffixIcon: GestureDetector(
              onTap: togglePasswordVisibility,
              child: Icon(
                showPassword ? Icons.visibility_off : Icons.visibility,
                color: LightStandardTheme.colorGrey,
              ),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          obscureText: !showPassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field can not be empty';
            }
            if (value.length < 6) {
              return 'Password must have at least 6 characters';
            }
            final containsNumber = RegExp(r'\d').hasMatch(value);
            final containsLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
            if (!containsNumber || !containsLetter) {
              return 'Password must include both numbers and letters';
            }
            return null;
          },
        ),
      ),
    ]);
  }
}
