import 'package:flutter/material.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  String _dropdownvalue = '1';

  final _items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            height: 50,
            minWidth: 200,
            color: const Color(0xff1d1e22).withOpacity(1),
            child: const Text('Animation Dialog',
                style: TextStyle(color: Colors.white))),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: 60,
          width: 80,
          decoration: BoxDecoration(
              color: const Color(0xffebedfe),
              borderRadius: BorderRadius.circular(18)),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: DropdownButton(
                items: _items.map((String item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownvalue = newValue!;
                  });
                },
                value: _dropdownvalue,
                borderRadius: BorderRadius.circular(18),
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 10,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                underline: Container(),
              ),
            ),
          ),
        )
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
