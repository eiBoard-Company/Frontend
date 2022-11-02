import 'package:eiboard_flutter/pages/open_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EiBoard());
}

class EiBoard extends StatelessWidget {
  const EiBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpenScreen(),
    );
  }
}
