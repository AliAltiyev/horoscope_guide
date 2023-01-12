import 'package:flutter/material.dart';

class CheckBoxListTileExample extends StatefulWidget {
  const CheckBoxListTileExample({Key? key}) : super(key: key);

  @override
  State<CheckBoxListTileExample> createState() =>
      _CheckBoxListTileExampleState();
}

class _CheckBoxListTileExampleState extends State<CheckBoxListTileExample> {
  bool checkBoxState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Interaction"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.purple,
              )),
              child: CheckboxListTile(
                  selectedTileColor: Colors.purple,
                  secondary: Icon(Icons.color_lens_rounded),
                  title: Text("Dark theme"),
                  activeColor: Colors.purple,
                  value: checkBoxState,
                  onChanged: (value) {
                    setState(() {
                      checkBoxState = value ?? false;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
