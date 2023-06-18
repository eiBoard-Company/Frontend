import 'package:flutter/material.dart';

import '../../themes/light_standard_theme.dart';

class PasswordInputField extends StatefulWidget {
  final bool repeatPassword;
  const PasswordInputField({Key? key, required this.repeatPassword})
      : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
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
        width: 302,
        height: 69,
        child: TextFormField(
          key: const Key('passwordInput1'),
          cursorColor: LightStandardTheme.colorPrimary,
          focusNode: focusNode1,
          controller: passwordController,
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
                color: focusNode1.hasFocus
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
      if (widget.repeatPassword) const SizedBox(height: 15),
      if (widget.repeatPassword)
        SizedBox(
          width: 302,
          height: 69,
          child: TextFormField(
            key: const Key('PasswordInput2'),
            cursorColor: LightStandardTheme.colorPrimary,
            focusNode: focusNode2,
            decoration: InputDecoration(
              labelText: 'Repeat Password',
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
                  color: focusNode2.hasFocus
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
