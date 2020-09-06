import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function onChanged;
  final String hintText;
  final double textFontSize;
  final double hintFontSize;
  final bool iscollapsed;
  final bool autofocus;
  final String initialValue;
  final TextInputType keyboardType;
  final int maxLines;

  CustomTextField(
      {@required this.textFontSize,
      @required this.hintFontSize,
      @required this.hintText,
      @required this.onChanged,
      this.iscollapsed = false,
      this.autofocus = false,
      this.initialValue = "",
      this.keyboardType = TextInputType.text,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      initialValue: initialValue,
      maxLines: maxLines,
      onChanged: onChanged,
      autofocus: autofocus,
      style: TextStyle(
        fontSize: textFontSize,
        color: Colors.white,
      ),
      decoration: InputDecoration(
          border: InputBorder.none,
          isCollapsed: iscollapsed,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: hintFontSize,
            color: Colors.white60,
          )),
    );
  }
}
