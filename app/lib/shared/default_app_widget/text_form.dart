

import 'package:flutter/material.dart';

Widget defaultTextFormWithIcons({
  bool secure = false,
  required Function validationFun,
  required TextEditingController controller,
  required String labelText,
  required double fontSize,
  Function? onChange,
  Icon? prefixIcon,
  IconButton? suffixIcon,
  TextInputType? keyboardType,
}) {
  return TextFormField(
    controller: controller,
    validator: (value) => validationFun(value),
    keyboardType: keyboardType,
    onChanged: (value) => onChange,
    obscureText: secure,
    decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x33000000),
            )),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: fontSize,
          color: Color(0x66000000),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon),
  );
}

Widget defaultTextForm({
  bool secure = false,
  required Function validationFun,
  required TextEditingController controller,
  String? labelText,
  String? hintText,
  Function? onChange,
  IconButton? prefixIcon,
  IconButton? suffixIcon,
  TextInputType? keyboardType,
}) {
  return
    TextFormField(
      controller: controller,
      validator: (value) => validationFun(value),
      keyboardType: keyboardType,
      onChanged: (value) => onChange,
      obscureText: secure,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );
}
