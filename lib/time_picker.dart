import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _timeofDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                '${_timeofDay.hour.toString().padLeft(2, '0')}:${_timeofDay.minute.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                _selectTime();
              },
              height: 50,
              minWidth: 150,
              color: Colors.blueAccent.withOpacity(0.7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: const Text(
                'Open Time Picker',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime() async {
    TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _timeofDay);

    if (picked != null) {
      setState(() {
        _timeofDay = picked;
      });
    }
  }
}
