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
        suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              if (widget.textController.text != null &&
                  widget.textController.text.length > 0) {
                widget.searchProvider
                    .searchApi(widget.textController.text, context);
                widget.addItem();
              }

              FocusScope.of(context).unfocus();
            }),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.black)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.black.withOpacity(0.1))),
        contentPadding: EdgeInsets.fromLTRB(10, 10.0, 0.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.black)),
        hintText: "Wiki search...",
      ),
    );
  }
}
