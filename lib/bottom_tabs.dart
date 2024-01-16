import 'package:basic_ui/Stepper_example.dart';
import 'package:basic_ui/date_picker.dart';
import 'package:basic_ui/home_page.dart';
import 'package:basic_ui/image_picker.dart';
import 'package:basic_ui/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({super.key});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const BottomSheetPage(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.yellow,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Basic UI'),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.directions_bus),
              ),
              Tab(
                icon: Icon(Icons.timer),
              ),
              Tab(
                icon: Icon(Icons.calendar_month_rounded),
              ),
              Tab(
                icon: Icon(Icons.account_box),
              ),
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                icon: Icon(Icons.directions_boat),
              ),
            ],
            isScrollable: true,
          ),
        ),
        body: TabBarView(children: [
          const BottomSheetPage(),
          const TimePicker(),
          const DatePickerPage(),
          const StepperPage(),
          const ImagePickerExample(),
          Container(
            color: Colors.blue.withOpacity(0.3),
            child: const Center(
              child: Text("boat"),
            ),
          ),
        ]),

        //    _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            if (index >= 0 && index < _pages.length) {
              setState(() {
                _selectedIndex = index;
              });
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_rounded), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.videocam_sharp), label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),

        drawer: Drawer(
          child: ListView(
            children: [
              _builddrawer(),
              _builtItem(
                  icon: Icons.home,
                  title: 'Home',
                  ontap: () {
                    Navigator.pop(context);
                  }),
              _builtItem(
                  icon: Icons.notifications_rounded,
                  title: 'Notification',
                  ontap: () => Navigator.pushNamed(context, "Notification")),
              _builtItem(
                  icon: Icons.person,
                  title: "profile",
                  ontap: () => Navigator.pushNamed(context, 'profile')),
              _builtItem(
                  icon: Icons.settings,
                  title: "Setting",
                  ontap: () => Navigator.pushNamed(context, 'Setting'))
            ],
          ),
        ),
      ),
    );
  }
}

_builddrawer() {
  return const DrawerHeader(
      decoration: BoxDecoration(color: Color(0xff1d1e22)),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(''),
            radius: 40,
          ),
          SizedBox(height: 10),
          Text(
            'Sabin Dahal',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ));
}

_builtItem(
    {required IconData icon,
    required String title,
    required GestureTapCallback ontap}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: ontap,
    minLeadingWidth: 5,
  );
}
