import 'package:app/model/contact_info.dart';

class Cashier {
  int id;
  String name;
  ContactInfo contactInfo;
  int clientId;
  String username;
  String password;

  Cashier({required this.id, required this.name, required this.contactInfo, required this.clientId, required this.username, required this.password});
}