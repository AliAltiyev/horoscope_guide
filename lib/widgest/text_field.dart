import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({Key? key}) : super(key: key);

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  int passwordMaxLine = 1;

  late final FocusNode passWordFocusNode;

  @override
  void initState() {
    super.initState();
    passWordFocusNode = FocusNode();
    passWordFocusNode.addListener(() {
      setState(() {
        if (passWordFocusNode.hasFocus) {
          passwordMaxLine = 4;
        } else {
          passwordMaxLine = 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              focusNode: passWordFocusNode,
              scrollPhysics: const RangeMaintainingScrollPhysics(),
              cursorRadius: const Radius.circular(10),
              scribbleEnabled: false,
              textInputAction: TextInputAction.send,
              maxLength: 16,
              maxLines: passwordMaxLine,
              autocorrect: true,
              maxLengthEnforcement:
                  MaxLengthEnforcement.truncateAfterCompositionEnds,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.purple.withOpacity(0.1),
                filled: true,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                label: const Icon(Icons.access_alarm_rounded),
                floatingLabelStyle: const TextStyle(color: Colors.red),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              scrollPhysics: RangeMaintainingScrollPhysics(),
              cursorRadius: Radius.circular(10),
              scribbleEnabled: false,
              textInputAction: TextInputAction.send,
              maxLength: 16,
              autocorrect: true,
              maxLengthEnforcement:
                  MaxLengthEnforcement.truncateAfterCompositionEnds,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                label: Icon(Icons.access_alarm_rounded),
                floatingLabelStyle: TextStyle(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}
