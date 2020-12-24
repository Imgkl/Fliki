import 'package:flikipedia/provider/search_provider.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.headline2.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
      textCapitalization: TextCapitalization.words,
      controller: widget.textController,
      textInputAction: TextInputAction.search,
      onSubmitted: (text) {
        setState(() async {
          if (text != null && text.length > 0) {
            widget.textController.text = text;
            widget.searchProvider.searchApi(text, context);
            widget.addItem();
          }
          FocusScope.of(context).unfocus();
        });
      },
      cursorColor: Colors.black,
      decoration: InputDecoration(
          suffixIcon: (widget.textController.text.length > 0)
              ? IconButton(
                  icon: Icon(Icons.clear),
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
              borderSide: BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.1))),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: Colors.black)),
          hintText: " Search",
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.3),
          )),
    );
  }
}
