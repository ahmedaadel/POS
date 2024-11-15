import 'package:app/model/category.dart';
import 'package:app/model/item_size.dart';


class MenuItem {
  int id;
  Category category;
  String name;
  bool isAvailable;
  String description;
  int clientId;

  List<ItemSize> sizes = [];

  MenuItem({required this.id, required this.category, required this.name, required this.isAvailable, required this.description, required this.clientId, required List<ItemSize> sizes});
}