
import 'package:flutter/material.dart';

import '../Shared/Component.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({Key? key}) : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    Map<String, double> sizeAndItsPrice = {
      "صغير": 30.0,
      "وسط": 35.5,
      "كبير": 110.0,
      "لارج" : 150.0,
      "دابل" :150.0
    };

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text("فراخ"),

          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemBuilder: (context, index) =>
                cartItem(imgDescription: "سندوتش زنجر", count: 1, sizeAndItsPrice: sizeAndItsPrice, context: context),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 3,
          ),
        ),
      ),
    );
  }
}
