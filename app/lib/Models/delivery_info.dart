import 'package:app/models/customer.dart';
import 'package:app/models/delivery_boy.dart';

class DeliveryInfo {
  int id;
  DeliveryBoy deliveryBoy;
  double shippingPrice;
  String notes;
  Customer customer;

  DeliveryInfo({required this.id, required this.deliveryBoy, required this.shippingPrice, required this.notes, required this.customer});
}