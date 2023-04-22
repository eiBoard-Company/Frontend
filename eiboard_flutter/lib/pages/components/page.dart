import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/light_standard_theme.dart';

//TODO: add option without plus

class PageBackground extends StatelessWidget {
  final Widget child;
  final String topic;

  const PageBackground({
    Key? key,
    required this.topic,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: LightStandardTheme.colorMain,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: SafeArea(
            child: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              elevation: 0,
              leading: IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.black, size: 30),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 30,
                  ),
                  //TODO: add onPressed
                ),
              ],
              centerTitle: true,
              title: Text(
                topic,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
              backgroundColor: LightStandardTheme.colorMain,
            ),
          ),
        ),
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            const SizedBox(height: 0),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Colors.white,
              ),
              child: child,
            ))
          ],
        ))));
  }
}
