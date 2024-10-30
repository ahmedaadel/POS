import 'package:app/models/cashier.dart';
import 'package:app/models/delivery_info.dart';
import 'package:app/models/order_line.dart';
import 'package:app/models/shift.dart';

class Order {
  int id;
  double subtotalPrice;
  double taxPrice;
  double totalPrice;
  double discountPrice;
  double serviceFee;
  DateTime orderDate;
  Shift shift;
  String orderStatus;
  String notes;
  String type;
  DeliveryInfo deliveryInfo;
  bool isDeliveryOrder;
  Cashier cashier;
  int clientId;

  List<OrderLine> orderLines = [];

  Order({
    required this.id,
    required this.subtotalPrice,
    required this.taxPrice,
    required this.totalPrice,
    required this.discountPrice,
    required this.serviceFee,
    required this.orderDate,
    required this.shift,
    required this.orderStatus,
    required this.notes,
    required this.type,
    required this.deliveryInfo,
    required this.isDeliveryOrder,
    required this.cashier,
    required this.clientId,
  });
}

