import 'package:eiboard_flutter/pages/components/page.dart';
import 'package:eiboard_flutter/themes/light_standard_theme.dart';
import 'package:flutter/material.dart';

import 'components/button.dart';
import 'package:date_field/date_field.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  List<String> tags = [
    'Software Engineering',
    'Formale Sprachen',
    'Mathematik II',
    'Datenbanken I',
    'Webengineering II',
    'Betriebssysteme',
    'Rechnerarchitektur I'
  ];
  int tag1 = 0;
  String newTag = '';
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      topic: 'Create New Task',
      showPlusIcon: false,
      child: Column(children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 337,
          child: TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Title'),
          ),
        ),
        SizedBox(
            width: 337,
            child: DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                suffixIcon: Icon(Icons.date_range),
                labelText: 'Date',
              ),
              mode: DateTimeFieldPickerMode.date,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) =>
                  (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {},
            )),
        SizedBox(
            width: 337,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 202, 0),
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      labelText: 'Start Time',
                    ),
                    mode: DateTimeFieldPickerMode.time,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) =>
                        (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                    onDateSelected: (DateTime value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(202, 0, 0, 0),
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      labelText: 'End Time',
                    ),
                    mode: DateTimeFieldPickerMode.time,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) =>
                        (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                    onDateSelected: (DateTime value) {},
                  ),
                )
              ],
            )),
        SizedBox(
          width: 337,
          child: TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 4,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 337,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Category'),
              const SizedBox(height: 10.0),
              Wrap(
                spacing: 5.0,
                runSpacing: 7.0,
                children: List<Widget>.generate(
                  tags.length,
                  (index) => ChoiceChip(
                    label: Text(tags[index]),
                    selected: tag1 == index,
                    selectedColor: LightStandardTheme.colorDueToday,
                    backgroundColor: LightStandardTheme.colorDarkFont,
                    labelStyle: TextStyle(
                      color: tag1 == index
                          ? Colors.white // Farbe des ausgewählten Chips
                          : LightStandardTheme.colorLightFont, // Standardfarbe
                    ),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: tag1 == index
                              ? LightStandardTheme
                                  .colorDueToday // Borderfarbe des ausgewählten Chips
                              : LightStandardTheme
                                  .tagBorder, // Standard-Borderfarbe
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    onSelected: (bool selected) {
                      setState(() {
                        tag1 = (selected ? index : null)!;
                      });
                    },
                  ),
                ).toList(),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 337,
          child: Row(children: [
            SizedBox(
              width: 100, // maximale Breite jedes Chips
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Neuer Chip',
                  border: InputBorder.none,
                ),
                onChanged: (value) => setState(() => newTag = value),
                onSubmitted: (value) {
                  _controller.clear();
                  setState(() {
                    tags.add(newTag);
                    newTag = ''; // leert das Textfeld
                  });
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                _controller.clear();
                setState(() {
                  tags.add(newTag);
                  newTag = ''; // leert das Textfeld
                });
              },
            ),
          ]),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Button(
                'Create Task',
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
          ),
        ),
      ]),
    );
  }
}
