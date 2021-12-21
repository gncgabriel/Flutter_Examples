import 'package:flutter/cupertino.dart';

abstract class ScreenSizeUtils {
  static double phoneScreen() {
    return 400;
  }

  static double tabletScreen() {
    return 1024;
  }

  static double desktopScreen() {
    return 1280;
  }

  static double getWidthScreen(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width;
  }

  static bool isPhoneScreen(BuildContext context) {
    return getWidthScreen(context) <= ScreenSizeUtils.phoneScreen();
  }

  static bool isTabletScreen(BuildContext context) {
    return getWidthScreen(context) > ScreenSizeUtils.phoneScreen() &&
        getWidthScreen(context) < ScreenSizeUtils.desktopScreen();
  }

  static bool isDesktopScreen(BuildContext context) {
    return getWidthScreen(context) > ScreenSizeUtils.tabletScreen();
  }
}
