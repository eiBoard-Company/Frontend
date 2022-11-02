import 'package:flutter/material.dart';
import 'package:eiboard_flutter/themes/light_standard_theme.dart';

void main() {
  runApp(const EiBoard());
}

class EiBoard extends StatelessWidget {
  const EiBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
      ),
    );
  }
}
