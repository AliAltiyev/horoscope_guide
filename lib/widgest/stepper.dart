import 'package:flutter/material.dart';

class StepperExample extends StatefulWidget {
  const StepperExample({Key? key}) : super(key: key);

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  String? email, password, name, sureName;
  int currentStep = 0;
  List steps = [];
  final emailKey = GlobalKey<FormFieldState>();
  final passwordKey = GlobalKey<FormFieldState>();
  final nameKey = GlobalKey<FormFieldState>();
  final sureNameKey = GlobalKey<FormFieldState>();
  bool stepState = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    steps = steppers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text('appbarTitle'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stepper(
                currentStep: currentStep,
                steps: steppers(),
                onStepTapped: (step) => setState(() {
                  currentStep = step;
                }),
                onStepContinue: () {
                  setState(() {
                    if (currentStep < steps.length - 1) {
                      currentStep++;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (currentStep > 0) {
                      currentStep--;
                    }
                  });
                },
              )
            ],
          ),
        ));
  }

  List<Step> steppers() {
    return [
      Step(

          label: Text("Email"),
          title: Text("Email"),
          content: TextFormField(
            onSaved: (_email) => email = _email,
            decoration: InputDecoration(label: Text("Email")),
            validator: (value) {
              if (value!.length < 6) {
                return "Incorrect email";
              }
            },
          )),
      Step(
          title: Text("Password"),
          content: TextFormField(
            onSaved: (_password) => password = _password,
            decoration: InputDecoration(label: Text("Password")),
            validator: (value) {
              if (value!.length < 6) {
                return "incorrect password";
              }
            },
          )),
      Step(
          title: Text("Name"),
          content: TextFormField(
              onSaved: (_name) => name = _name,
              decoration: InputDecoration(label: Text("Name")),
              validator: (value) {
                if (value!.length < 6) {
                  return "name";
                }
              })),
      Step(
          title: Text("SureName"),
          content: TextFormField(
            onSaved: (_sureName) => sureName = _sureName,
            decoration: InputDecoration(label: Text("SureName")),
          )),
    ];
  }


}
