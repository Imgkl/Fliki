import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DynamicColor {
  Color getColor(opacity) {
    return Get.theme.brightness.toString() == "Brightness.light"
        ? Colors.black.withOpacity(opacity)
        : Colors.white.withOpacity(opacity);
  }
}
