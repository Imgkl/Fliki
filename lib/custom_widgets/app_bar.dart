import 'package:flikipedia/custom_widgets/dynamic_text.dart';
import 'package:flikipedia/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appbar extends StatefulWidget {
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58.0, right: 10, left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // Scaffold.of(context).openDrawer();
              print("${Get.theme.brightness.toString()}");
              if (Get.theme.brightness == Brightness.light) {
                ThemeController.to.setThemeMode(ThemeMode.dark);
              } else {
                ThemeController.to.setThemeMode(ThemeMode.light);
              }
            },
            child: Image.asset(
                Get.theme.brightness.toString() == "Brightness.light"
                    ? "assets/equal.png"
                    : "assets/equal_white.png",
                scale: 3),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "wikipedia",
              style: Theme.of(context).textTheme.headline4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: DynamicColor().getColor(1.0)),
            ),
          ),
        ],
      ),
    );
  }
}
