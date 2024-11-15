import 'package:app/models/category.dart';
import 'package:app/models/item_size.dart';
import 'package:app/models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:app/Shared/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wheel_picker/wheel_picker.dart';
import '../Shared/component.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  Map<int, int> current_selected_size_index_map = {};
  Map<int, int> counter_map = {};

  @override
  Widget build(BuildContext context) {
// Declare the categories
Category burgersCategory = Category(id: 1, name: 'برجر', description: 'جريل', parentCategory: null, clientId: 1);
Category pizzasCategory = Category(id: 2, name: 'بيتزا', description: 'بيتزا مدخنه', parentCategory: null, clientId: 1);
Category drinksCategory = Category(id: 3, name: 'مشروبات', description: 'مشروبات ومياه عازيه', parentCategory: null, clientId: 2);
Category saladsCategory = Category(id: 4, name: 'سلطات', description: 'سلطات صحيه طازجه', parentCategory: null, clientId: 2);

// Declare the menu items
    MenuItem classicBurger = MenuItem(
      id: 1,
      category: burgersCategory,
      name: 'برجر كلاسيك',
      isAvailable: true,
      description: 'وصف المنتج يمكن ان يحتوي على اي شئ',
      clientId: 1,
      sizes: [],
    );

    MenuItem margheritaPizza = MenuItem(
      id: 2,
      category: pizzasCategory,
      name: 'بيتزا مارجرتا',
      isAvailable: true,
      description: 'وصف المنتج يمكن ان يحتوي على اي شئ',
      clientId: 1,
      sizes: [],
    );

    MenuItem colaDrink = MenuItem(
      id: 3,
      category: drinksCategory,
      name: 'كولا',
      isAvailable: true,
      description: 'كولا او بيبسي او سبرايت',
      clientId: 2,
      sizes: [],
    );

    MenuItem cheeseburger = MenuItem(
      id: 4,
      category: burgersCategory,
      name: 'تشيز برجر',
      isAvailable: false,
      description: 'تشيز برجر ب sauce الهالوبينو',
      clientId: 1,
      sizes: [],
    );

    MenuItem caesarSalad = MenuItem(
      id: 5,
      category: saladsCategory,
      name: 'سلطة irish',
      isAvailable: true,
      description:
          'سلطة ايرلاندية بحبوب الكريسب',
      clientId: 2,
      sizes: [],
    );

// Declare the item sizes and assign them to the corresponding MenuItem
classicBurger.sizes.addAll([
  ItemSize(id: 1, menuItem: classicBurger, size: 'صغير', price: 5.99),
  ItemSize(id: 2, menuItem: classicBurger, size: 'وسط', price: 7.99),
  ItemSize(id: 3, menuItem: classicBurger, size: 'كبير', price: 9.99),
]);

    margheritaPizza.sizes.addAll([
      ItemSize(
          id: 4, menuItem: margheritaPizza, size: '12-انش', price: 1250.99),
      ItemSize(
          id: 5, menuItem: margheritaPizza, size: 'اكس لارج', price: 14.99),
    ]);

    colaDrink.sizes.addAll([
      ItemSize(id: 6, menuItem: colaDrink, size: 'عادي', price: 1.99),
      ItemSize(id: 7, menuItem: colaDrink, size: 'المعلم', price: 2.49),
      ItemSize(id: 8, menuItem: colaDrink, size: 'الاسطورة ', price: 2.99),
    ]);

    cheeseburger.sizes.addAll([
      ItemSize(id: 9, menuItem: cheeseburger, size: 'صغير', price: 6.99),
      ItemSize(id: 10, menuItem: cheeseburger, size: 'وسط', price: 8.99),
    ]);

    caesarSalad.sizes.addAll([
      ItemSize(id: 11, menuItem: caesarSalad, size: 'عادي', price: 7.99),
      ItemSize(id: 12, menuItem: caesarSalad, size: 'كبير', price: 9.99),
    ]);

// Add the MenuItems to the list
    List<MenuItem> menuItems = [];
    menuItems.add(classicBurger);
    menuItems.add(margheritaPizza);
    menuItems.add(colaDrink);
    menuItems.add(cheeseburger);
    menuItems.add(caesarSalad);

    for (int i = 0; i < menuItems.length; i++) {
      if (counter_map[menuItems[i].id] == null) {
        counter_map[menuItems[i].id] = 0;
      }
      if (current_selected_size_index_map[menuItems[i].id] == null) {
        current_selected_size_index_map[menuItems[i].id] = 0;
      }
    }

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
                itemCard(context, menuItems[index]),
            separatorBuilder: (context, index) =>
                Container(height: 1, width: double.infinity, color: grey_color),
            itemCount: menuItems.length,
          ),
        ),
      ),
    );
  }

  Widget designedSizeCard(context, ItemSize itemSize, item_id, myIndex,
      current_selected_size_index_map) {
    if (current_selected_size_index_map[item_id] != myIndex) {
      return wheelItem(context, itemSize);
    } else {
      return Container(
        width: getAppSize(context, 130),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: grey_color,
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
                        DefaultText(
                            text: itemSize.size,
                            font: "Roboto",
                            font_size: getAppSize(context, 23)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffFFEA00),
                          radius: getAppSize(context, 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultText(
                                  text: "${itemSize.price}",
                                  font_size: getAppSize(context, 14.5),
                                  font: "Roboto"),
                              DefaultText(
                                text: "ج.م",
                                font_size: getAppSize(context, 16.5),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(height: 1, width: double.infinity, color: grey_color),
          ],
        ),
      );
    }
  }


  Widget wheelItem(context, ItemSize itemSize) {
    return Container(
      width: getAppSize(context, 130),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getAppWidth(context, 15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: DefaultText(
                    text: itemSize.size, font_size: getAppSize(context, 13))),
            DefaultText(
                text: "${itemSize.price}",
                font_size: getAppSize(context, 13),
                font: "Roboto")
          ],
        ),
      ),
    );
  }

  Widget itemCard(context, MenuItem item) {
    return Container(
      height: getAppHeight(context, 165),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // holding the image
                Container(
                  height: getAppHeight(context, 85),
                  width: getAppWidth(context, 85),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: SvgPicture.asset(
                      fit: BoxFit.scaleDown,
                      "assets/images/burger.svg",
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: getAppWidth(context,5)),
                  child: Column(
                    children: [
                      DefaultText(
                          text: item.name,
                          font_size: getAppSize(context, 12),
                          color: const Color(0xff000000)),
                    Text(
                    item.description,
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: "IBMPlex",
                        overflow: TextOverflow.ellipsis,
                        fontSize: getAppSize(context, 11),
                        color: grey_color),
                  ),
                               
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(right: getAppWidth(context, 30)),
              child: WheelPicker(
                  itemCount: item.sizes.length,
                  onIndexChanged: (index) {
                    current_selected_size_index_map[item.id] = index;
                    setState(() {});
                  },
                  builder: (context, index) => designedSizeCard(
                      context,
                      item.sizes[index],
                      item.id,
                      index,
                      current_selected_size_index_map),
                  looping: false,
                  style: WheelPickerStyle(
                    itemExtent: getAppSize(context, 16.5) *
                        getAppSize(context, 4), // Text height
                    squeeze: getAppSize(context, 1.2),
                    diameterRatio: 50,
                    surroundingOpacity: 1,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: getAppWidth(context, 40),top:  getAppWidth(context, 10),bottom:  getAppWidth(context, 10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      radius: 20,
                      child: IconButton(
                          onPressed: () {
                            counter_map[item.id] != null
                                ? counter_map[item.id] =
                                    (counter_map[item.id]! + 1)
                                : counter_map[item.id] = 1;
                  
                            setState(() {});
                          },
                          icon: const Icon(Icons.add))),
                ),
                Expanded(
                  child: Center(
                    child: DefaultText(
                        text: "${counter_map[item.id]}",
                        font_size: getAppSize(context, 20)),
                  ),
                ),
                Expanded(
                  child: CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                       radius: 20,
                      child: IconButton(
                          onPressed: () {
                            counter_map[item.id] != null &&
                                    counter_map[item.id]! - 1 >= 0
                                ? counter_map[item.id] =
                                    (counter_map[item.id]! - 1)
                                : counter_map[item.id] = counter_map[item.id]!;
                            setState(() {});
                          },
                          icon: const Icon(Icons.remove))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
