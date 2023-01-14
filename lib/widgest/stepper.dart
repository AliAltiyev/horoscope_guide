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
  bool stepStateError = false;

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
          title: const Text('appbarTitle'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stepper(
                currentStep: currentStep,
                steps: steppers(),
                // onStepTapped: (step) => setState(() {
                //   currentStep = step;
                // }),
                onStepContinue: () {
                  setState(() {
                    checkStepValidation();
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
          state: setStepperState(0),
          isActive: true,
          label: const Text("Email"),
          title: const Text("Email"),
          content: TextFormField(
            key: emailKey,
            onSaved: (_email) => email = _email,
            decoration: const InputDecoration(label: Text("Email")),
            validator: (value) {
              if (value!.length < 6) {
                return "Incorrect email";
              }
            },
          )),
      Step(
          state: setStepperState(1),
          isActive: true,
          title: const Text("Password"),
          content: TextFormField(
            key: passwordKey,
            onSaved: (_password) => password = _password,
            decoration: const InputDecoration(label: Text("Password")),
            validator: (value) {
              if (value!.length < 6) {
                return "incorrect password";
              }
            },
          )),
      Step(
          isActive: true,
          state: setStepperState(2),
          title: const Text("Name"),
          content: TextFormField(
              key: nameKey,
              onSaved: (_name) => name = _name,
              decoration: const InputDecoration(label: Text("Name")),
              validator: (value) {
                if (value!.length < 6) {
                  return "name";
                }
              })),
      Step(
          isActive: true,
          title: const Text("SureName"),
          content: TextFormField(
            key: sureNameKey,
            onSaved: (_sureName) => sureName = _sureName,
            decoration: const InputDecoration(label: Text("SureName")),
          )),
    ];
  }

  StepState setStepperState(int i) {
    if (currentStep == i) {
      if (stepStateError) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  void checkStepValidation() {
    switch (currentStep) {
      case 0:
        if (emailKey.currentState!.validate()) {
          emailKey.currentState?.save();
          emailKey.currentState?.validate();
          stepStateError = false;
          currentStep = 1;
        } else {
          stepStateError = true;
        }
        break;
      case 1:
        if (passwordKey.currentState!.validate()) {
          passwordKey.currentState?.save();
          passwordKey.currentState?.validate();
          stepStateError = false;
          currentStep = 2;
        } else {
          stepStateError = true;
        }
        break;
      case 2:
        if (nameKey.currentState!.validate()) {
          nameKey.currentState?.save();
          nameKey.currentState?.validate();
          stepStateError = false;
          currentStep = 3;
        } else {
          stepStateError = true;
        }
        break;
    }
  }
}
