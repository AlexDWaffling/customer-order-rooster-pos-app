import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../dao/itemDAO.dart';
import '../entity/item.dart';
import '../entity/order.dart';

part 'database.g.dart';

@Database(version: 1, entities: [ProductItem])
abstract class AppDatabase extends FloorDatabase{
  ItemDAO get itemDAO;
  static Future<AppDatabase> init() async {
    AppDatabase instance = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return instance;
  }
}