import 'package:flutter/material.dart';

const dropDownMenuItems = <String>["BMW", "Jeep", "Ferrari", "Lamborghini"];

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
  String selectedCar = dropDownMenuItems.last;

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
                  secondary: const Icon(Icons.color_lens_rounded),
                  title: const Text("Dark theme"),
                  activeColor: Colors.purple,
                  value: checkBoxState,
                  onChanged: (value) {
                    setState(() {
                      checkBoxState = value ?? false;
                    });
                  }),
            ),
            RadioListTile(
                title: const Text("Man"),
                value: "Man",
                groupValue: radioGroupValue,
                onChanged: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(value.toString()),
                    duration: const Duration(milliseconds: 300),
                  ));

                  setState(() {
                    setState(() {
                      debugPrint(value.toString());

                      radioGroupValue = value!;
                    });
                  });
                }),
            RadioListTile(
                title: const Text("Woman"),
                value: "Woman",
                groupValue: radioGroupValue,
                onChanged: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(value.toString()),
                    duration: const Duration(milliseconds: 300),
                  ));

                  setState(() {
                    debugPrint(value.toString());
                    setState(() {
                      radioGroupValue = value!;
                    });
                  });
                }),
            RadioListTile(
                tileColor: Colors.purple,
                visualDensity: const VisualDensity(vertical: 3),
                activeColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Colors.purple)),
                title: const Text(
                  "Bisexual",
                  style: TextStyle(color: Colors.white),
                ),
                value: "Bisexual",
                groupValue: radioGroupValue,
                onChanged: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(value.toString()),
                    duration: const Duration(milliseconds: 300),
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
                  duration: const Duration(milliseconds: 300),
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
            // DropdownButton(
            //   items: dropDownMenuItems
            //       .map((e) => DropdownMenuItem(
            //               child: Text(
            //             e.toString(),
            //             style: const TextStyle(color: Colors.green),
            //           )))
            //       .toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       debugPrint(selectedCar);
            //       selectedCar = value;
            //     });
            //   },
            //   value: selectedCar,
            // )
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      alignment: Alignment.topLeft,
                      value: selectedCar,
                      icon: const Icon(Icons.arrow_downward),
                      borderRadius: BorderRadius.circular(18),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          selectedCar = value!;
                        });
                      },
                      items: dropDownMenuItems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
