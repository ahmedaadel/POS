import 'package:app/Modules/itemSpecifications.dart';
import 'package:app/Shared/component.dart';
import 'package:app/Shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';

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
                children: [
                  Column(
                    children: [
                      DefaultText(text: "التفاصيل", font_size: 16),
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
                  DefaultText(text: "1121 :رقم الطلب", font_size: 16)
                ],
              ),
              SizedBox(
                height: getAppSize(context, 20),
              ),
              Row(children: [
                unitWithPrice(
                    unmOfUnits: "2",
                    unit: "بيتزا اتشيكين رانش صغير",
                    fontSize: 20),
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
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ItemSpecifications(),
                          ));
                    },
                    icon: const Icon(IconlyBroken.delete)),
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
                DefaultText(
                  text: "300",
                  font_size: 16,
                  color: Colors.grey[600]!,
                )
              ]),
              SizedBox(
                height: getAppSize(context, 5),
              ),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Expanded(
                  flex:2,
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
                DefaultText(
                  text: "300",
                  font_size: 16,
                  color: Colors.grey[600]!,
                )
              ]),
              SizedBox(
                height: getAppSize(context, 5),
              ),
              Row(children: [
                DefaultText(
                  text: " ملاحظه:",
                  font_size: 16,
                  color: Colors.grey[600]!,
                ),
                SizedBox(
                  width: getAppSize(context, 5),
                ),
                DefaultText(
                    text: "بدون ملح", font_size: 16, color: Colors.grey[600]!),
              ]),
              SizedBox(
                height: getAppSize(context, 5),
              ),
              SizedBox(
                height: getAppSize(context, 5),
              ),
              Container(
                color: Colors.grey[600],
                height: 1,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
