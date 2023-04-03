import 'dart:html';

import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/button.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      topic: 'Create Task',
      child: Column(children: [
        SizedBox(
          width: 337,
          child: TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Title'),
          ),
        ),
        SizedBox(
            width: 337,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Date'),
              ),
            )),
        SizedBox(
            width: 337,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 202, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Start Time'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(202, 0, 0, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), labelText: 'End Time'),
                  ),
                )
              ],
            )),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: Button(
            'Create Tasks',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CreateTaskScreen();
                  },
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
