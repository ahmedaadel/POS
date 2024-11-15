import 'package:flutter/material.dart';

Text defaultText(
    {required String text,
      Color color = Colors.black,
      String font = "IBMPlex",
      double? fontSize =18 ,
      TextStyle? style }) {
  return Text(text,
      style: style ??
          TextStyle(color: color, fontFamily: font, fontSize: fontSize));
}