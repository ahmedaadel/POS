import 'package:app/models/contact_info.dart';

class Customer {
  int id;
  String name;
  ContactInfo contactInfo;
  int clientId;

  Customer({required this.id, required this.name, required this.contactInfo, required this.clientId});
}