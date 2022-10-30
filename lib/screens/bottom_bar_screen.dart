import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:shazam_vin_project/screens/search_screen_details.dart';
import 'package:shazam_vin_project/screens/wine_description_screen.dart';
import 'package:shazam_vin_project/screens/wine_searcher_result_screen.dart';

import 'home_screen.dart';
import 'ocr_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedScreen = 0;
  static final List<Widget> _screenOptions = <Widget>[
    const SearchScreenDetail(),
    const SingleChildScrollView(
      child: MyHomePage(),
    ),
    const WineDetailPage1(),
    // const Text("Camera"),
    const OcrPageScreen(),
    const WineSearchResult(),
    // const Text('Profile'),
  ];

  void _iconOnTapped(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(
    //     "current height is: " + MediaQuery.of(context).size.height.toString());
    // print("current width is: " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      backgroundColor: Colors.white, //const Color(0xffE38B29),
      body: Center(child: _screenOptions[_selectedScreen]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _iconOnTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xffE9C9A2),
        unselectedItemColor: const Color(0xFF526480),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            label: "Home",
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
            label: "Search",
            activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_camera_regular),
            label: "Camera",
            activeIcon: Icon(FluentSystemIcons.ic_fluent_camera_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_people_regular),
            label: "people",
            activeIcon: Icon(FluentSystemIcons.ic_fluent_people_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            label: "Profile",
            activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
          ),
        ],
      ),
    );
  }
}
