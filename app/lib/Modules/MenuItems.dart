
import 'package:app/models/category.dart';
import 'package:app/models/item_size.dart';
import 'package:app/models/menu_item.dart';
import 'package:flutter/material.dart';

import '../Shared/component.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, double> sizeAndItsPrice = {
      "صغير": 30.0,
      "وسط": 35.5,
      "كبير": 110.0,
      "لارج" : 150.0,
      "دابل" :150.0
    };

// Declare the categories
Category burgersCategory = Category(id: 1, name: 'برجر', description: 'جريل', parentCategory: null, clientId: 1);
Category pizzasCategory = Category(id: 2, name: 'بيتزا', description: 'بيتزا مدخنه', parentCategory: null, clientId: 1);
Category drinksCategory = Category(id: 3, name: 'مشروبات', description: 'مشروبات ومياه عازيه', parentCategory: null, clientId: 2);
Category saladsCategory = Category(id: 4, name: 'سلطات', description: 'سلطات صحيه طازجه', parentCategory: null, clientId: 2);

// Declare the menu items
MenuItem classicBurger = MenuItem(
  id: 1,
  category: burgersCategory,
  name: 'Classic Burger',
  isAvailable: true,
  description: 'A delicious classic beef burger with lettuce, tomato, and cheese.',
  clientId: 1,
  sizes: [],
);

MenuItem margheritaPizza = MenuItem(
  id: 2,
  category: pizzasCategory,
  name: 'Margherita Pizza',
  isAvailable: true,
  description: 'Classic pizza with fresh mozzarella, basil, and tomatoes.',
  clientId: 1,
  sizes: [],
);

MenuItem colaDrink = MenuItem(
  id: 3,
  category: drinksCategory,
  name: 'Cola',
  isAvailable: true,
  description: 'Refreshing cola drink.',
  clientId: 2,
  sizes: [],
);

MenuItem cheeseburger = MenuItem(
  id: 4,
  category: burgersCategory,
  name: 'Cheeseburger',
  isAvailable: false,
  description: 'Beef burger with melted cheddar cheese and fresh veggies.',
  clientId: 1,
  sizes: [],
);

MenuItem caesarSalad = MenuItem(
  id: 5,
  category: saladsCategory,
  name: 'Caesar Salad',
  isAvailable: true,
  description: 'Crisp romaine lettuce with Caesar dressing, croutons, and parmesan.',
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
  ItemSize(id: 4, menuItem: margheritaPizza, size: '12-inch', price: 10.99),
  ItemSize(id: 5, menuItem: margheritaPizza, size: '16-inch', price: 14.99),
]);

colaDrink.sizes.addAll([
  ItemSize(id: 6, menuItem: colaDrink, size: 'Small', price: 1.99),
  ItemSize(id: 7, menuItem: colaDrink, size: 'Medium', price: 2.49),
  ItemSize(id: 8, menuItem: colaDrink, size: 'Large', price: 2.99),
]);

cheeseburger.sizes.addAll([
  ItemSize(id: 9, menuItem: cheeseburger, size: 'Small', price: 6.99),
  ItemSize(id: 10, menuItem: cheeseburger, size: 'Medium', price: 8.99),
]);

caesarSalad.sizes.addAll([
  ItemSize(id: 11, menuItem: caesarSalad, size: 'Regular', price: 7.99),
  ItemSize(id: 12, menuItem: caesarSalad, size: 'Large', price: 9.99),
]);

// Add the MenuItems to the list
List<MenuItem> menuItems = [];
menuItems.add(classicBurger);
menuItems.add(margheritaPizza);
menuItems.add(colaDrink);
menuItems.add(cheeseburger);
menuItems.add(caesarSalad);


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
                itemCard(context,menuItems[index]),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 2,
          ),
        ),
      ),
    );
  }
}
