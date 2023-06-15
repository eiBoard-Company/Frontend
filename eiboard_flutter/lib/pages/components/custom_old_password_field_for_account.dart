import 'package:flutter/material.dart';

import '../../themes/light_standard_theme.dart';

class OldPasswordInputFieldAccount extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const OldPasswordInputFieldAccount(
      {Key? key, required this.controller, this.validator})
      : super(key: key);

  @override
  State<OldPasswordInputFieldAccount> createState() =>
      _OldPasswordInputFieldAccountState();
}

class _OldPasswordInputFieldAccountState
    extends State<OldPasswordInputFieldAccount> {
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
        width: 337,
        child: TextFormField(
          cursorColor: LightStandardTheme.colorPrimary,
          focusNode: focusNode,
          controller: widget.controller,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: LightStandardTheme.colorPrimary),
            ),
            labelText: 'Old Password',
            labelStyle: TextStyle(
                color: focusNode.hasFocus
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
          validator: widget.validator,
        ),
      ),
    ]);
  }
}
