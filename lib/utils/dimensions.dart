import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double firstMainContainer = screenHeight / 1.7075;
  static double secondMainContainer = screenHeight / 2.27666666;

  static double pageViewContainer = screenHeight / 3.104;
  static double pageTextContainer = screenHeight / 5.7;
  static double pageView = screenHeight / 2.134375;

  //Height

  static double height10 = screenHeight / 68.3;
  static double height20 = screenHeight / 34.15;
  static double height15 = screenHeight / 45.5333;

  // Width
  static double width10 = screenWidth / 41.10;
  static double width15 = screenWidth / 27.5;
  static double width20 = screenWidth / 20.55;
  static double width5 = screenWidth / 82.2;

  // margin

  static double imgConMarginTop200 = screenHeight / 4.01; //4.55; 3.415;
  static double imgConMarginBottom25 = screenHeight / 34.15; //27.32;
}
