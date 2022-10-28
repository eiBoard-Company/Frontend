import 'package:flutter/material.dart';
import 'package:eiboard_flutter/themes/light_standard_theme.dart';

void main() {
  runApp(const EiBoard());
}

class EiBoard extends StatelessWidget {
  const EiBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // ignore: unnecessary_new
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            'Hello World',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
