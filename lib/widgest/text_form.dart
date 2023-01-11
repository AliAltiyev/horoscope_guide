import 'package:flutter/material.dart';

class TextFormExample extends StatefulWidget {
  const TextFormExample({Key? key}) : super(key: key);

  @override
  State<TextFormExample> createState() => _TextFormExampleState();
}

class _TextFormExampleState extends State<TextFormExample> {
  String? email, password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: <Widget>[
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onSaved: (value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter email";
                          } else if (value!.length < 10) {
                            return "Your email is too short";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            label: Text("Email"),
                            prefixIcon: Icon(Icons.email)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onSaved: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter password";
                          } else if (value!.length < 5) {
                            return "Your password is too short";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          labelText: "Password",
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
                            borderSide: const BorderSide(
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
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          final result = formKey.currentState?.validate();
                          if (result == true) {
                            formKey.currentState?.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("$email $password")));
                          }
                        },
                        child: const Text("Log in"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
