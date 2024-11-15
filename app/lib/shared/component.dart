import 'package:app/Shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'default_app_widget/text.dart';

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
                      defaultText(text: imgDescription, color: Colors.black)),
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



