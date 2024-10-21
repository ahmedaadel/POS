import 'package:app/Shared/constants.dart';
import 'package:app/models/item_size.dart';
import 'package:app/models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wheel_picker/wheel_picker.dart';

// Widget designedSizeCard(context,ItemSize itemSize, myIndex, currentSelectedIndex){

Widget sizeCard(context,ItemSize itemSize){

  return  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
       Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey,
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Expanded(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 DefaultText(text:itemSize.size,font_size: getAppSize(context, 18)),
               ],
             ),
           ),
           Expanded(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 CircleAvatar(backgroundColor: Color(0xffFFEA00),
                 radius: getAppSize(context, 25),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     DefaultText(
                      text: "${itemSize.price}",
                      font_size: getAppSize(context, 16.5),
                      font: "Roboto"
                     ),
                     // DefaultText(
                     //  text: "ج.م",
                     //  font_size: getAppSize(context, 16.5),
                     //
                     // ),
                   ],
                 ),
                     
//                  ),
//                ],
//              ),
//            )
        
//           ],
//         ),
//       ),
  
//       Container(
//         height: 1,
//         width: double.infinity,
//         color: Colors.grey,
        
        
//       ),
//     ],
//   );
// }
// }
// Widget sizeCard(context, ItemSize itemSize) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//              Container(
//         height: 1,
//         width: double.infinity,
//         color: Colors.grey,
        
        
//       ),

//       Expanded(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [],
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: Color(0xffFFEA00),
//                     radius: getAppSize(context, 35),
//                     child: const Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [],
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//            Container(
//         height: 1,
//         width: double.infinity,
//         color: Colors.grey,
        
        
//       ),
//     ],
//   );
// }

// Widget wheelItem(context, ItemSize itemSize) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       DefaultText(text: itemSize.size, font_size: getAppSize(context, 22)),
//       DefaultText(
//           text: "${itemSize.price}",
//           font_size: getAppSize(context, 16.5),
//           font: "Roboto")
//     ],
//   );
// }

// Widget itemCard(context, MenuItem item, current_selected_size_index) {
//   int count = 0;

//   return Container(
//     height: getAppHeight(context, 161),
//     width: double.infinity,
//     child: Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             flex: 1,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // holding the image
//                 Container(
//                   height: getAppHeight(context, 110),
//                   width: getAppWidth(context, 110),
//                   child: Padding(
//                     padding: const EdgeInsets.all(1.0),
//                     child: SvgPicture.asset(
//                       fit: BoxFit.scaleDown,
//                       "assets/icons/burger.svg",
//                     ),
//                   ),
//                 ),

//                 DefaultText(
//                     text: item.name,
//                     font_size: getAppSize(context, 12),
//                     color: const Color(0xff000000)),

//                 Text(
//                   item.description,
//                   style: TextStyle(
//                       fontFamily: "IBMPexl",
//                       overflow: TextOverflow.ellipsis,
//                       fontSize: getAppSize(context, 10),
//                       color: Color(0x80000000)),
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: WheelPicker(
//                 itemCount: item.sizes.length,
//                 onIndexChanged: (index) {
//                   current_selected_size_index=index;
//                   print("selected now $current_selected_size_index");
//                 },
//                 builder: (context, index) =>
//                     designedSizeCard(context, item.sizes[index],index,current_selected_size_index),
              
//                 looping: false,
//                 style: WheelPickerStyle(
//                   itemExtent: getAppSize(context, 16.5) *
//                       getAppSize(context, 5), // Text height
//                   squeeze: 1,
//                   diameterRatio: 2,
//                   surroundingOpacity: 0.25,
//                   magnification: 1.2,
//                 )),
//           ),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                     backgroundColor: Colors.grey[400],
//                     child: IconButton(
//                         onPressed: () {}, icon: const Icon(Icons.add))),
//                 DefaultText(text: "$count", font_size: getAppSize(context, 20)),
//                 CircleAvatar(
//                     backgroundColor: Colors.grey[400],
//                     child: IconButton(
//                         onPressed: () {}, icon: const Icon(Icons.remove))),
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
              diameterRatio: 1,
              clipBehavior: Clip.hardEdge, // Correct usage
              children: sizes,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.grey[400],
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add))),
                DefaultText(text: "$count", font_size: getAppSize(context, 20)),
                CircleAvatar(
                    backgroundColor: Colors.grey[400],
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.remove))),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

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

Widget searchForm({
  required TextEditingController controller,
  required String labelText,
  Function? onChange,
  IconButton? suffixIcon,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      onChanged: (value) => onChange,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          labelText: labelText,
          suffixIcon: suffixIcon),
    );

Text DefaultText(
    {String text = "",
    Color color = Colors.black,
    String font = "IBMPlex",
    double? font_size,
    TextStyle? style}
    ) {
  return Text(text,

      style: style ?? TextStyle(
        color: color,
        fontFamily: font,
        fontSize: font_size
      )
      );
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

Widget DefaultTextForm({
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
      textAlignVertical: TextAlignVertical.bottom,
      controller: controller,
      validator: (value) => validationFun(value),
      keyboardType: keyboardType,
      onChanged: (value) => onChange,
      obscureText: secure,
      decoration: InputDecoration(
          alignLabelWithHint: true,
          enabledBorder: UnderlineInputBorder(
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
          enabledBorder: UnderlineInputBorder(
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
