import 'package:flikipedia/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Util {
  static Future initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    Get.lazyPut<ThemeController>(() => ThemeController());
    ThemeController.to.getThemeModeFromPreferences();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
