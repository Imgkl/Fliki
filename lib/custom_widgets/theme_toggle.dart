import 'package:flikipedia/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            width: 35,
            height: 35,
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
            child: Icon(Get.theme.brightness == Brightness.light
                ? LineIcons.sun_o
                : FontAwesomeIcons.moon),
          ),
        ],
      ),
    );
  }
}
