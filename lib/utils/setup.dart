import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Util {
  static Future initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
