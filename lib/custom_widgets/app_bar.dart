import 'package:flikipedia/custom_widgets/dynamic_text.dart';
import 'package:flikipedia/custom_widgets/theme_toggle.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58.0, right: 10, left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ThemeToggle(),
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
