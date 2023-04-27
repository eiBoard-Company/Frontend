import 'package:flutter/material.dart';

class TodoBoxMainScreen extends StatelessWidget {
  final String textInCardTop;
  final String textInCardMiddle;
  final String textInCardBottom;
  final Color colorOfCard;
  final double widthOfCard;
  final double heightOfCard;
  final Color colorOfText;
  final VoidCallback? onTap;

  const TodoBoxMainScreen({
    Key? key,
    required this.textInCardTop,
    required this.textInCardMiddle,
    required this.textInCardBottom,
    required this.colorOfCard,
    required this.widthOfCard,
    required this.heightOfCard,
    required this.colorOfText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widthOfCard,
        height: heightOfCard,
        child: InkWell(
          onTap: onTap,
          child: Card(
            color: colorOfCard,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    textInCardTop,
                    style: TextStyle(color: colorOfText),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    textInCardMiddle,
                    style: TextStyle(
                        color: colorOfText,
                        fontWeight: FontWeight.bold,
                        fontSize: 45.0),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    textInCardBottom,
                    style: TextStyle(
                        color: colorOfText, fontWeight: FontWeight.w100),
                  )
                ],
              ),
            )),
          ),
        ));
  }
}
