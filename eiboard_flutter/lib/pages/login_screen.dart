import 'package:flutter/material.dart';

import '../themes/light_standard_theme.dart';

//still need to implement

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "eiBoard",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: LightStandardTheme.colorMain,
      ),
      body: const Center(
        child: Image(
          image: AssetImage('images/logoEiBoard.png'),
        ),
      ),
    );
  }
}
