import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  /// این تابع حتما در ابتدای صفحه اصلی یا هر صفحه‌ای که میخوای استفاده کنی، فراخوانی می‌شه
  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    // اینها می‌تونن برای درصدگیری از صفحه استفاده بشن
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}
