import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pos_application_for_service_robot/process.dart';

import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import 'controllers/productController.dart';
import 'database/database.dart';
import 'entity/order.dart';
import 'advance.dart';
import 'home.dart';
import 'payment.dart';
import 'robot_expression.dart';
import 'table.dart';
import 'models/model_bar.dart';
import 'models/model_tab.dart';
import 'widgets/item_bar.dart';
import 'widgets/logo_bar.dart';

import 'constants/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // static Future<AppDatabase> init() async {
  //   AppDatabase instance = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //   return instance;
  // }
  // await Get.putAsync<AppDatabase>(() async {
  //   final instance =
  //       await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //   return instance;
  // });
  // WidgetsFlutterBinding.ensureInitialized();
  // await windowManager.ensureInitialized();
  // if (Platform.isWindows) {
  //   WindowManager.instance.setMinimumSize(const Size(1024, 600));
  //   WindowManager.instance.setMaximumSize(const Size(1024, 600));
  // }

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  // runApp(const RobotExpression());
  final List<OrderItem> list = [];
}

// initServices() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Get.putAsync<AppDatabase>(() => AppDatabase.init());
// }

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(240, 240, 240, 240),
      body: Container(
        margin: const EdgeInsets.only(top: 24, right: 12),
        padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          border:
              Border.all(width: 1.0, color: Color.fromRGBO(226, 224, 224, 1)),
          color: Color.fromRGBO(249, 249, 249, 1),
        ),
        child: HomePage(),
      ),
    );
  }
}
