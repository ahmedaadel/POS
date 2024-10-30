import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Shared/Component.dart';
import '../Shared/constants.dart';

class ItemSpecifications extends StatefulWidget {
  const ItemSpecifications({Key? key}) : super(key: key);

  @override
  State<ItemSpecifications> createState() => ItemSpecificationsState();
}

class ItemSpecificationsState extends State<ItemSpecifications> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar:AppBar(
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
          color:Colors.grey[400] ,
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
                            DefaultText(text: "التفاصيل", font_size: 16),
                            const SizedBox(height: 5,),
                            Container(
                              color: Colors.black,
                              height: 1,
                              width: 80,
                            )
                          ],
                        ),
                        Spacer(),
                        DefaultText(text: "1121 :رقم الطلب", font_size: 16)
                      ],
                    ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
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
                                DefaultText(text: "يمكن ان يحتوي علي اي شي ")
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Row(
                                   children: [DefaultText(text: "صغير",font_size: 16 ,font: "Roboto",),
                                    const SizedBox(width: 20,),
                                     CircleAvatar(backgroundColor: const Color(0xffFFEA00),
                                       radius: getAppSize(context, 20),
                                       child: DefaultText(
                                         text: "25",
                                         font_size: getAppSize(context, 16.5),
                                         font: "Roboto",

                                       ),
                                     ),],
                                ),
                                SizedBox(
                                  height: getAppSize(context, 15),
                                ),
                                Row(
                                 children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.grey[400],
                                        child: IconButton(
                                            onPressed: () {}, icon: const Icon(Icons.add))),
                                     SizedBox(
                                      width:  getAppSize(context, 20),
                                    ),
                                    DefaultText(text: "1", font_size: getAppSize(context, 20)),
                                    SizedBox(
                                     width:  getAppSize(context, 20),
                                   ),
                                    CircleAvatar(
                                        backgroundColor: Colors.grey[400],
                                        child: IconButton(
                                            onPressed: () {}, icon: const Icon(Icons.remove))),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: getAppSize(context, 15),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(text: "ملاحظات", font_size: 16),
                            TextFormField(
                              decoration:const  InputDecoration(
                                hintText: 'مثال : بدون كاتشب', // This shows as a hint inside the text box
                              )),
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
