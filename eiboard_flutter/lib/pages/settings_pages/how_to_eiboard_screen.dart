import '/../pages/components/page.dart';
import 'package:flutter/material.dart';

class HowToEiBoardScreen extends StatelessWidget {
  const HowToEiBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
        topic: 'How to eiBoard',
        child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 30,
                    ),
                  ]),
            )));
  }
}
