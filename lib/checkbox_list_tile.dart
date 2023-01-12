import 'package:flutter/material.dart';

class CheckBoxListTileExample extends StatefulWidget {
  const CheckBoxListTileExample({Key? key}) : super(key: key);

  @override
  State<CheckBoxListTileExample> createState() =>
      _CheckBoxListTileExampleState();
}

class _CheckBoxListTileExampleState extends State<CheckBoxListTileExample> {
  bool checkBoxState = false;
  bool switchState = false;
  var radioGroupValue = "";
  int sliderValue = 10;

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
            RadioListTile(
                title: Text("Man"),
                value: "Man",
                groupValue: radioGroupValue,
                onChanged: (value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(value.toString()),duration: Duration(milliseconds: 300),));

                  setState(() {
                    setState(() {
                      debugPrint(value.toString());

                      radioGroupValue = value!;
                    });
                  });
                }),
            RadioListTile(
                title: Text("Woman"),
                value: "Woman",
                groupValue: radioGroupValue,
                onChanged: (value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(value.toString()),duration: Duration(milliseconds: 300),));

                  setState(() {
                    debugPrint(value.toString());
                    setState(() {
                      radioGroupValue = value!;
                    });
                  });
                }),
            RadioListTile(
              tileColor: Colors.purple,
              visualDensity: VisualDensity(vertical: 3),
              activeColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide(color: Colors.purple)),
                title: Text("Bisexual",style: TextStyle(color: Colors.white),),
                value: "Bisexual",
                groupValue: radioGroupValue,
                onChanged: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(value.toString()),
                    duration: Duration(milliseconds: 300),
                  ));
                  setState(() {
                    debugPrint(value.toString());
                    setState(() {
                      radioGroupValue = value!;
                    });
                  });
                }),
            SwitchListTile(
              value: switchState,
              onChanged: (value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(value.toString()),
                  duration: Duration(milliseconds: 300),
                ));
                setState(() {
                  switchState = value;
                });
              },
              title: const Text("Allow internet connection"),
              activeTrackColor: Colors.green,
              activeColor: Colors.green,
            ),
            Slider(
                value: sliderValue.toDouble(),
                max: 100,
                divisions: 20,
                label: sliderValue.toString(),
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value.toInt();
                  });
                }),
            Slider(
                value: sliderValue.roundToDouble(),
                max: 100,
                divisions: 100,
                label: sliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value.toInt();
                  });
                }),
          ],
        ),
      ),
    );
  }
}
