import '/../pages/components/page.dart';
import 'package:flutter/material.dart';

class HowToEiBoardScreen extends StatelessWidget {
  const HowToEiBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageBackground(
        topic: 'How to eiBoard',
        child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                  ]),
            )));
  }
}
