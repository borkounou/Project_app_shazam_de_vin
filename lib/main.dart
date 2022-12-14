import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shazam_vin_project/screens/camera_screen.dart';
import 'package:shazam_vin_project/screens/search_screen_details.dart';

import 'package:shazam_vin_project/screens/welcome_screen.dart';
import 'package:get/get.dart';

// List<CameraDescription> cameras = [];

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  // static const color = Color(0xffE38B29);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shazam App',
      theme: ThemeData(
        primaryColor: const Color(0xffE38B29),
      ),
      home: const WelcomePage(),
      // const CameraScreen()
      // WelcomePage(),
      // const SearchScreenDetail(),
    );
  }
}
