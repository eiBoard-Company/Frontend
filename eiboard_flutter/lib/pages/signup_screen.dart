import 'package:flutter/material.dart';

import '../themes/light_standard_theme.dart';

//still need to implement

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
