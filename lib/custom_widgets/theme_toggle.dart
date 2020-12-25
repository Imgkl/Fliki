import 'package:flikipedia/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ThemeToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (Get.theme.brightness == Brightness.light) {
            ThemeController.to.setThemeMode(ThemeMode.dark);
          } else {
            ThemeController.to.setThemeMode(ThemeMode.light);
          }
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: Get.theme.brightness == Brightness.light
                      ? [
                          const Color(0xFF8983F7),
                          const Color(0xFFA3DAFB),
                        ]
                      : [
                          const Color(0xDDFF0080),
                          const Color(0xDDFF8C00),
                        ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            Positioned.fill(
              child: Icon(Get.theme.brightness != Brightness.light
                  ? FontAwesomeIcons.sun
                  : FontAwesomeIcons.moon),
            ),
          ],
        ),
      ),
    );
  }
}
