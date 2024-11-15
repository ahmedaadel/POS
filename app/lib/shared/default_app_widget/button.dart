import 'package:app/Shared/default_app_widget/text.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

Widget defaultButton({
  context,
  required double height,
  required double width,
  required double radius,
  required Color color,
  required String text,
  required Color fontColor,
  required double fontSize,
  String? font = " ",
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: getAppWidth(context, width),
    height: getAppHeight(context, height),
    child: MaterialButton(
        splashColor: const Color(0xff353535),
        onPressed: onPressed,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: color,
        child: Center(
          child: defaultText(
              text: text,
              color: fontColor,
              font: font ?? "",
              fontSize: fontSize),
        )),
  );
}
