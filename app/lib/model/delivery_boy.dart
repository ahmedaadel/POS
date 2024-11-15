import 'package:app/model/contact_info.dart';

class DeliveryBoy {
  int id;
  String name;
  ContactInfo contactInfo;
  int clientId;

  DeliveryBoy({required this.id, required this.name, required this.contactInfo, required this.clientId});
}