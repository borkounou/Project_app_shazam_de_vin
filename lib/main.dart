import 'package:flutter/material.dart';

import 'package:shazam_vin_project/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  // static const color = Color(0xffE38B29);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shazam App',
      theme: ThemeData(
        primaryColor: Color(0xffE38B29),
      ),
      home: const WelcomePage(),
    );
  }
}
