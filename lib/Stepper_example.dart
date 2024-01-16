import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({super.key});

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _currentStep = 0;

  List<Step> StepList() => [
        Step(
          title: const Text("Account", style: TextStyle(color: Colors.black)),
          isActive: _currentStep >= 0,
          state: _currentStep <= 0 ? StepState.editing : StepState.complete,
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  labelText: "Email",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  labelText: "Password",
                ),
              )
            ],
          ),
        ),
        Step(
          title: const Text("Address", style: TextStyle(color: Colors.black)),
          isActive: _currentStep >= 0,
          state: _currentStep <= 0 ? StepState.editing : StepState.complete,
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  labelText: "Address",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  labelText: "Pin Code",
                ),
              )
            ],
          ),
        ),
        Step(
            title: const Text("Confirm", style: TextStyle(color: Colors.black)),
            isActive: _currentStep >= 2,
            state: StepState.complete,
            content: const Center(
              child: Text('Confirm'),
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        steps: StepList(),
        type: StepperType.horizontal,
        elevation: 0.0,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < (StepList().length - 1)) {
            setState(() {
              _currentStep += 1;
            });
          } else {}
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
      ),
    );
  }
}
