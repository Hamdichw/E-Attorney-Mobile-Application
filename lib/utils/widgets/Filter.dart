import 'package:flutter/material.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:get/get.dart';

import '../theme_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Select Example',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: Themes().getThemeMode(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? singleValue = 'flu'; // Nullable string
  List<int> multipleValue = [2];

  // List of choice items for multiple choice
  List<S2Choice<int>> choices = [
    S2Choice<int>(value: 1, title: 'Ionic'),
    S2Choice<int>(value: 2, title: 'Flutter'),
    S2Choice<int>(value: 3, title: 'React Native'),
  ];

  // Function to extract titles based on selected values
  List<String?> getSelectedTitles(List<int> selectedValues) {
    return selectedValues
        .map((value) =>
            choices.firstWhere((choice) => choice.value == value).title)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Select Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Selected Single Value:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8.0,
              children: [
                Chip(
                  label: Text(singleValue ?? ''),
                  onDeleted: () {
                    setState(() {
                      singleValue = null;
                    });
                  },
                ), // Handling null case
              ],
            ),
            SizedBox(height: 20),
            SizedBox(height: 40),
            Text(
              'Selected Multiple Values:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8.0,
              children: getSelectedTitles(multipleValue).map((title) {
                return Chip(
                  label: Text(title!),
                  onDeleted: () {
                    setState(() {
                      multipleValue.remove(choices
                          .firstWhere((choice) => choice.title == title)
                          .value);
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (BuildContext context, setState) {
                            return AlertDialog(
                              title: Text('Multiple Choice'),
                              content: Container(
                                width: double.maxFinite,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: choices.map((choice) {
                                    return CheckboxListTile(
                                      title: Text(choice.title!),
                                      value:
                                          multipleValue.contains(choice.value),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value != null && value) {
                                            multipleValue.add(choice.value);
                                          } else {
                                            multipleValue.remove(choice.value);
                                          }
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                Expanded(
                  child: SmartSelect<int>.multiple(
                    title: 'Multiple Choice',
                    selectedValue: multipleValue,
                    choiceItems: choices,
                    onChange: (state) =>
                        setState(() => multipleValue = state.value),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Themes().changeTheme();
                },
                child: Text("change"))
          ],
        ),
      ),
    );
  }
}
