import 'package:app/model/menu_item.dart';
import 'package:app/model/order.dart';

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