import 'package:flutter/material.dart';

class DIsmissibleListviewPage extends StatefulWidget {
  const DIsmissibleListviewPage({super.key});

  @override
  State<DIsmissibleListviewPage> createState() =>
      _DIsmissibleListviewPageState();
}

class _DIsmissibleListviewPageState extends State<DIsmissibleListviewPage> {
  List<String> items = [
    "dart",
    "java",
    "kotlin",
    "python",
    "c++",
    "c",
    "c#",
    "javascript",
    "php",
    "ruby",
    "swift",
    "go",
    "rust",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: items.length,
          padding: const EdgeInsets.symmetric(vertical: 18),
          itemBuilder: (context, index) {
            return Dismissible(
                onDismissed: (direction) {
                  items.removeAt(index);
                },
                confirmDismiss: (DismissDirection direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Delete"),
                          content:
                              const Text("Are you sure you want to delete?"),
                          actions: [
                            ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text("Yes")),
                            ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text("No"))
                          ],
                        );
                      },
                    );
                  } else {
                    return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Save"),
                            content: const Text(
                                "Are you sure you want to save this cart"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text("Yes")),
                              ElevatedButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("No"))
                            ],
                          );
                        });
                  }
                },
                background: Container(
                  height: 50,
                  color: Colors.orange.withOpacity(0.6),
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Delete',
                    textAlign: TextAlign.left,
                  ),
                ),
                secondaryBackground: Container(
                  height: 50,
                  color: Colors.orange.withOpacity(0.6),
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Save',
                    textAlign: TextAlign.right,
                  ),
                ),
                key: ValueKey<String>(items[index]),
                child: Container(
                  color: Colors.green.withOpacity(0.3),
                  margin: const EdgeInsets.only(top: 15),
                  height: 55,
                  child: Center(
                    child: Text(items[index]),
                  ),
                ));
          }),
    );
  }
}
