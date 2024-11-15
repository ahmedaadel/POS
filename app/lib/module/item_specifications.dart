import 'package:app/Shared/default_app_widget/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../shared/constants.dart';

class ItemSpecifications extends StatefulWidget {
  const ItemSpecifications({Key? key}) : super(key: key);

  @override
  State<ItemSpecifications> createState() => ItemSpecificationsState();
}

class ItemSpecificationsState extends State<ItemSpecifications> {
  var itemCount = 1;
  String? selectedValue;
  final List<Map<String, String>> dropdownItems = [
    {'title': 'اكستر جبنه موتزاريلا', 'subtitle': '+ 15'},
    {'title': 'اكستر جبنه شيدر', 'subtitle': '+ 20'},
    {'title': 'اكستر جبنه رومي ', 'subtitle': '+ 30'},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[400],
          title: const Text("ملخص الطلب"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: Container(
          color: Colors.grey[400],
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        defaultText(text: "التفاصيل", fontSize: 16),
                        const SizedBox(
                          height: 5,
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
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  fit: BoxFit.scaleDown,
                                  "assets/icons/burger.svg",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                defaultText(text: "برجر لحم ")
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    defaultText(
                                      text: "صغير",
                                      fontSize: 16,
                                      font: "Roboto",
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: const Color(0xffFFEA00),
                                      radius: getAppSize(context, 20),
                                      child: defaultText(
                                        text: "25",
                                        fontSize: getAppSize(context, 16.5),
                                        font: "Roboto",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getAppSize(context, 15),
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.grey[400],
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                itemCount++;
                                              });
                                            },
                                            icon: const Icon(Icons.add))),
                                    SizedBox(
                                      width: getAppSize(context, 20),
                                    ),
                                    defaultText(
                                        text: itemCount.toString(),
                                        fontSize: getAppSize(context, 20)),
                                    SizedBox(
                                      width: getAppSize(context, 20),
                                    ),
                                    CircleAvatar(
                                        backgroundColor: Colors.grey[400],
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                itemCount--;
                                              });
                                            },
                                            icon: const Icon(Icons.remove))),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getAppSize(context, 15),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defaultText(text: "اضافات", fontSize: 16),

                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedValue,
                                isExpanded: true,
                                dropdownColor: Colors.grey[200],
                                items: dropdownItems.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item['title'],
                                    child: Container(
                                      color: Colors.grey[300],
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          defaultText(
                                              text: item['subtitle']!,
                                              fontSize: 14),
                                          defaultText(text: item['title']!)
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                                icon: const Icon(Icons.arrow_drop_down),
                                underline:
                                    const SizedBox(), // To remove the underline
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
