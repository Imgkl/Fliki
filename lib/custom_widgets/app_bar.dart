import 'package:flikipedia/custom_widgets/dynamic_text.dart';
import 'package:flikipedia/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Appbar extends StatefulWidget {
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  changeThemeMode() {
    if (Get.theme.brightness == Brightness.dark) {
      _animationController.forward(from: 0.0);
    } else {
      _animationController.reverse(from: 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 58.0, right: 10, left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (Get.theme.brightness == Brightness.light) {
                ThemeController.to.setThemeMode(ThemeMode.dark);
              } else {
                ThemeController.to.setThemeMode(ThemeMode.light);
              }
              changeThemeMode();
            },
            child: Stack(
              children: <Widget>[
                Container(
                  width: width * 0.1,
                  height: width * 0.1,
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
