import 'package:flutter/material.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
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
        ),
        const SizedBox(
          height: 50,
        ),
        MaterialButton(
            onPressed: () {
              _openAnimatedDialog(context);
            },
            height: 50,
            minWidth: 200,
            color: const Color(0xff1d1e22),
            child: const Text('Animation Dialog',
                style: TextStyle(color: Colors.white))),
      ],
    );
  }

  void _openAnimatedDialog(BuildContext context) {
    showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 500),
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        },
        transitionBuilder: (context, a1, a2, Widget) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 3.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: AlertDialog(
                title: const Text("Hello"),
                content: const Text("I'm Sabin dahal"),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none),
              ),
            ),
          );
        });
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
