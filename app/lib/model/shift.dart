import 'package:app/model/cashier.dart';

class Shift {
  int id;
  DateTime shiftDate;
  DateTime startHour;
  DateTime endHour;
  Cashier cashier;
  double balance;
  int clientId;

  Shift({required this.id, required this.shiftDate, required this.startHour, required this.endHour, required this.cashier, required this.balance, required this.clientId});
}