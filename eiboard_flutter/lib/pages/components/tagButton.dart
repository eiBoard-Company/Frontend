import 'package:eiboard_flutter/pages/components/button.dart';
import 'package:eiboard_flutter/pages/createTask_screen.dart';
import 'package:eiboard_flutter/themes/light_standard_theme.dart';
import 'package:flutter/material.dart';

class tagButton extends StatelessWidget {
  final String TagName;
  const tagButton(this.TagName, {super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: test(), child: Text(TagName));
  }
}

test() {}
