import 'package:app/Shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wheel_picker/wheel_picker.dart';

// Widget designedSizeCard(context,ItemSize itemSize, myIndex, currentSelectedIndex){

Widget cartItem({
  required BuildContext context,
  required String imgDescription,
  required int count,
  required Map<String, double> sizeAndItsPrice,
}) {
  return Card(
    elevation: 0,
    shadowColor: Colors.white,
    color: Colors.white,
    child: Container(
      width: double.infinity,
      height: 150, // Set the fixed height as per your requirement
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and description section
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/burger.svg",
                height: getAppHeight(context, 50),
                width: getAppWidth(context, 50),
              ),
              const SizedBox(height: 8),
              Center(
                  child:
                      DefaultText(text: imgDescription, color: Colors.black)),
            ],
          ),
          const SizedBox(width: 50), // Space between columns

          // Scrollable size and price list
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: double.infinity, // Height for the ListView
                  child: ListView.separated(
                    itemCount: sizeAndItsPrice.length,
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      endIndent: 120, // to be updated
                      color: Colors.grey,
                    ),
                    itemBuilder: (context, index) {
                      String size = sizeAndItsPrice.keys.elementAt(index);
                      double price = sizeAndItsPrice.values.elementAt(index);
                      return chooseSizeWithPriceListItem(size, price);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: SvgPicture.asset(
                    "assets/icons/receipt.svg",
                    height: getAppHeight(context, 30),
                    width: getAppWidth(context, 30),
                  ),
                ),
              ],
            ),
          ),

          // Quantity and action buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.grey[400],
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.add))),
              Text("$count"),
              CircleAvatar(
                  backgroundColor: Colors.grey[400],
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.remove))),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget chooseSizeWithPriceListItem(String size, double price) {
  return Row(
    children: [
      Text(size),
      const SizedBox(
        width: 10,
      ),
      Text("\$$price"),
    ],
  );
}

void showToast({required String text, required ToastState state}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { success, error, warning }

Color toastColor(ToastState state) {
  Color color;
  switch (state) {
    case (ToastState.success):
      color = Colors.green;
      break;
    case (ToastState.error):
      color = Colors.red;
      break;
    case (ToastState.warning):
      color = Colors.amber;
      break;
  }
  return color;
}

Widget textForm({
  bool secure = false,
  required Function validationFun,
  required TextEditingController controller,
  String? labelText,
  String? hintText,
  Function? onChange,
  IconButton? prefixIcon,
  IconButton? suffixIcon,
  TextInputType? keyboardType,
}) =>
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

Text DefaultText(
    {String text = "",
    Color color = Colors.black,
    String font = "IBMPlex",
    double? font_size,
    TextStyle? style}) {
  return Text(text,
      style: style ??
          TextStyle(color: color, fontFamily: font, fontSize: font_size));
}

Widget DefaultButton({
  context,
  required double height,
  required double width,
  required double radius,
  required Color color,
  required String text,
  required Color font_color,
  required double font_size,
  String? font = " ",
  required VoidCallback onPressed,
}) {
  return Container(
    width: getAppWidth(context, width),
    height: getAppHeight(context, height),
    child: MaterialButton(
        splashColor: const Color(0xff353535),
        //database insert add tawsya logic
        onPressed: onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: color,
        child: Center(
          child: DefaultText(
              text: text,
              color: font_color,
              font: font ?? "",
              font_size: font_size),
        )),
  );
}


Widget DefaultTextFormWithIcons({
  bool secure = false,
  required Function validationFun,
  required TextEditingController controller,
  required String labelText,
  required double fontsize,
  Function? onChange,
  Icon? prefixIcon,
  IconButton? suffixIcon,
  TextInputType? keyboardType,
}) =>
    TextFormField(
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
            fontSize: fontsize,
            color: Color(0x66000000),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );

Widget unitWithPrice({ required String unmOfUnits,  required String unit,  required double fontSize, Color color=Colors.black,}) {
  return Row(children: [
    DefaultText(text:"x$unmOfUnits " , font_size: fontSize , color: color!),
    DefaultText(text: unit, font_size: fontSize, color: color!),
  ]);
}
