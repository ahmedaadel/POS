import 'package:app/Shared/Database/DatabaseHelper.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import '../../Network/Remote/Dio_Helper.dart';

class SyncService {
  final dbHelper = DatabaseHelper.instance;

  Future<void> syncData(String url,String tableName) async {
    final db = await dbHelper.database;
    final unSyncedData = await db.query(tableName, where: 'is_synced = 0');

    if (unSyncedData.isNotEmpty) {
      // Remove the 'is_synced' field from each record before sending
      List<Map<String, dynamic>> sanitizedData = unSyncedData.map((record) {
        record.remove('is_synced');  // Remove the 'is_synced' field
        record.remove('id');  // Remove the 'is_synced' field
        return record;
      }).toList();

      // Send the sanitized data to the global database
      final response = await DioHelper.postData(
        url: '$url/bulk',  // Adjust the API endpoint to match your table
        data: sanitizedData,  // Send the sanitized data
      );


      if (response.statusCode == 200) {
        // Mark records as synced in the local database
        for (var record in unSyncedData) {
          await db.update(
            tableName,
            {'is_synced': 1},  // Mark as synced
            where: 'id = ?',
            whereArgs: [record['id']],
          );
        }
      } else {
        // Handle sync failure (retry, log errors, etc.)
      }
    }
  }

  Future<void> syncAllTables() async {
    // List of tables to sync
    final Map<String,String> tablesToSync = {
      'credit_type':'creditTypes/bulk',
      // No dependencies
      'order_type':'orderTypes/bulk',
      // No dependencies
      'order_status':'orderStatuses/bulk',
      // No dependencies
      'size':'sizes/bulk',
      // No dependencies
      'industry':'industries/bulk',
      // No dependencies

      'client':'clients/bulk',
      // No dependencies
      'contact_info':'contactInfo/bulk',
      // No dependencies
      'category':'categories/bulk',
      // Has self-referencing parent_id, should be synced in a way that parent categories are inserted first

      'cashier':'cashiers/bulk',
      // Depends on contact_info and client
      'supplier':'suppliers/bulk',
      // Depends on contact_info and client
      'delivery_boy':'DAs/bulk',
      // Depends on contact_info and client
      'customer':'customers/bulk',
      // Depends on contact_info and client

      'Addition':'additions/bulk',
      // Depends on client
      'menu_item':'menuItems/bulk',
      // Depends on category and client
      'shift':'shifts/bulk',
      // Depends on cashier and client

      'order':'orders/bulk',
      // Depends on shift, order_status, order_type, delivery_info, cashier, and client
      'delivery_info':'deliveryInfo/bulk',
      // Depends on customer and delivery_boy
      'credit_debit':'credit/bulk',
      // Depends on shift and client

      'items_per_order':'itemsPerOrder/bulk',
      // Depends on order and menu_item
      'item_size':'itemSize/bulk',
      // Depends on menu_item and size
      'item_add_ons':'itemAddOns/bulk',
      // Depends on addition and items_per_order

      // 'statistics':'/bulk',
      // // Depends on client
    };

    for (var entry in tablesToSync.entries) {
      await syncData(entry.value, entry.key);
    }
  }
}
