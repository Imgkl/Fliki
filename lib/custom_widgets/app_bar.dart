import 'package:flikipedia/custom_widgets/dynamic_text.dart';
import 'package:flikipedia/custom_widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 58.0, right: 10, left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ThemeToggle(changeThemeMode()),
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
