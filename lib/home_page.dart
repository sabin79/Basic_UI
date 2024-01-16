import 'package:flutter/material.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MaterialButton(
            onPressed: () {
              _displayBottomSheet(context);
            },
            height: 50,
            minWidth: 200,
            color: const Color(0xff1d1e22),
            child: const Text('Bottom Sheet',
                style: TextStyle(color: Colors.white))),
      ),
    );
  }
}

Future _displayBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.blue,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (context) {
      return const SizedBox(
        height: 200,
        width: double.infinity,
        child: Center(
          child: Text(
            "Bottom Sheet",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
        ),
      );
    },
  );
}
