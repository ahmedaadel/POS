import 'package:app/models/menu_item.dart';

class ItemSize {
  int id;
  MenuItem? menuItem ;
  String size;
  double price;

  ItemSize({required this.id,   this.menuItem, required this.size, required this.price});
}