import 'package:flikipedia/custom_widgets/dynamic_text.dart';
import 'package:flikipedia/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InputFeild extends StatefulWidget {
  final TextEditingController textController;
  final SearchProvider searchProvider;
  final Function addItem;

  const InputFeild(
      {Key key, this.textController, this.searchProvider, this.addItem})
      : super(key: key);

  @override
  _InputFeildState createState() => _InputFeildState();
}

class _InputFeildState extends State<InputFeild> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.headline2.copyWith(
            color: Get.theme.brightness.toString() == "Brightness.light"
                ? Colors.black
                : Colors.white,
            fontWeight: FontWeight.bold,
          ),
      textCapitalization: TextCapitalization.words,
      controller: widget.textController,
      textInputAction: TextInputAction.search,
      onSubmitted: (text) {
        HapticFeedback.lightImpact();
        setState(() async {
          if (text != null && text.length > 0) {
            widget.textController.text = text;
            widget.searchProvider.searchApi(text, context);
            widget.addItem();
          }
          FocusScope.of(context).unfocus();
        });
      },
      cursorColor: DynamicColor().getColor(1.0),
      decoration: InputDecoration(
          suffixIcon: (widget.textController.text.length > 0)
              ? IconButton(
                  icon: Icon(Icons.clear, color: DynamicColor().getColor(1.0)),
                  onPressed: () {
                    setState(() {
                      widget.textController.clear();
                    });
                  })
              : Container(
                  height: 0,
                  width: 0,
                ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(
                color: DynamicColor().getColor(0.1),
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(
                color: DynamicColor().getColor(0.1),
              )),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(
              color: DynamicColor().getColor(0.1),
            ),
          ),
          hintText: " Search",
          hintStyle: TextStyle(
            color: DynamicColor().getColor(0.3),
          )),
    );
  }
}
