import 'package:firebase_database/firebase_database.dart';

class CallBackTable {
  final String? table;
  final bool isReached;

  CallBackTable({
    required this.table,
    required this.isReached,
  });

  factory CallBackTable.fromMap(Map<dynamic, dynamic> map) {
    return CallBackTable(
      table: map["name"],
      isReached: map["isReached"],
    );
  }
}
