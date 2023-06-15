import 'package:flutter/material.dart';

import '../../themes/light_standard_theme.dart';

class PasswordInputFieldAccount extends StatefulWidget {
  final TextEditingController controller;
  const PasswordInputFieldAccount({Key? key, required this.controller})
      : super(key: key);

  @override
  State<PasswordInputFieldAccount> createState() =>
      _PasswordInputFieldAccountState();
}

class _PasswordInputFieldAccountState extends State<PasswordInputFieldAccount> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  @override
  void initState() {
    super.initState();
    focusNode1.addListener(_onFocusChange);
    focusNode2.addListener(_onFocusChange);
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
        width: 337,
        child: TextFormField(
          cursorColor: LightStandardTheme.colorPrimary,
          focusNode: focusNode1,
          controller: passwordController,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: LightStandardTheme.colorPrimary),
            ),
            labelText: 'New Password',
            labelStyle: TextStyle(
                color: focusNode1.hasFocus
                    ? LightStandardTheme.colorPrimary
                    : LightStandardTheme.colorGrey),
            errorStyle: const TextStyle(color: LightStandardTheme.colorError),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: LightStandardTheme.colorError),
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
      SizedBox(
        width: 337,
        child: TextFormField(
          controller: widget.controller,
          cursorColor: LightStandardTheme.colorPrimary,
          focusNode: focusNode2,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: LightStandardTheme.colorPrimary),
            ),
            labelText: 'Repeat New Password',
            labelStyle: TextStyle(
                color: focusNode2.hasFocus
                    ? LightStandardTheme.colorPrimary
                    : LightStandardTheme.colorGrey),
            errorStyle: const TextStyle(color: LightStandardTheme.colorError),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: LightStandardTheme.colorError),
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
            if (value != passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ),
    ]);
  }
}
