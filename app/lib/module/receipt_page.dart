import 'package:app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../shared/default_app_widget/text.dart';
import 'item_specifications.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({Key? key}) : super(key: key);

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text("ملخص الطلب"),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      defaultText(text: "التفاصيل", fontSize: 16),
                      SizedBox(
                        height: getAppSize(context, 5),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 80,
                      )
                    ],
                  ),
                  const Spacer(),
                  defaultText(text: "1121 :رقم الطلب", fontSize: 16)
                ],
              ),
              SizedBox(
                height: getAppSize(context, 15),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) => receiptItem(context: context),
              )),
            ],
          ),
        ),
      ),
    );
  }
}



Widget receiptItem({
  required BuildContext context,
}) {
  return Column(
    children: [
      SizedBox(
        height: getAppSize(context, 20),
      ),
      Row(children: [
        unitWithPrice(
            unmOfUnits: "2", unit: "بيتزا اتشيكين رانش صغير", fontSize: 20),
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemSpecifications(),
                  ));
            },
            icon: const Icon(Icons.edit)),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(IconlyBroken.delete)),
      ]),
      Row(mainAxisSize: MainAxisSize.min, children: [
        Expanded(
          flex: 2,
          child: unitWithPrice(
              fontSize: 16,
              unit: "بيتزا اتشيكين رانش صغير",
              unmOfUnits: "2",
              color: Colors.grey[600]!),
        ),
        Expanded(
          flex: 1,
          child: unitWithPrice(
              unmOfUnits: "2",
              unit: "150",
              fontSize: 16,
              color: Colors.grey[600]!),
        ),
        defaultText(
          text: "300",
          fontSize: 16,
          color: Colors.grey[600]!,
        )
      ]),
      SizedBox(
        height: getAppSize(context, 5),
      ),
      Row(mainAxisSize: MainAxisSize.min, children: [
        Expanded(
          flex: 2,
          child: unitWithPrice(
              fontSize: 16,
              unit: "اكسترا جبنه",
              unmOfUnits: "2",
              color: Colors.grey[600]!),
        ),
        Expanded(
          flex: 1,
          child: unitWithPrice(
              unmOfUnits: "2",
              unit: "15",
              fontSize: 16,
              color: Colors.grey[600]!),
        ),
        defaultText(
          text: "300",
          fontSize: 16,
          color: Colors.grey[600]!,
        )
      ]),
      SizedBox(
        height: getAppSize(context, 15),
      ),
      Container(
        color: Colors.grey[600],
        height: 1,
        width: double.infinity,
      )
    ],
  );
}

Widget unitWithPrice({ required String unmOfUnits,  required String unit,  required double fontSize, Color color=Colors.black,}) {
  return Row(children: [
    defaultText(text:"x$unmOfUnits " , fontSize: fontSize , color: color!),
    defaultText(text: unit, fontSize: fontSize, color: color!),
  ]);
}
