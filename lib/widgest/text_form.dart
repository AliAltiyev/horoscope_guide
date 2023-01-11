import 'package:flutter/material.dart';

class TextFormExample extends StatefulWidget {
  const TextFormExample({Key? key}) : super(key: key);

  @override
  State<TextFormExample> createState() => _TextFormExampleState();
}

class _TextFormExampleState extends State<TextFormExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: <Widget>[
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  validator: (value) {
                    if (value!.length < 10) {
                      return "Your password is too short";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      label: Text("Email"), prefixIcon: Icon(Icons.email)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    validator: (value) {

                      if (value!.length < 5) {
                        return "Your password is too short";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Enter Email",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1.0,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.email)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
