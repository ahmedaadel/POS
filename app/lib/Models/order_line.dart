import 'package:app/models/menu_item.dart';
import 'package:app/models/order.dart';

class OrderLine {
  Order order;
  MenuItem menuItem;
  int quantity;
  double subtotalPrice;
  double discountPrice;

  OrderLine({required this.order, 
  required this.menuItem, 
  required this.quantity,
   required this.subtotalPrice,
    required this.discountPrice});
}