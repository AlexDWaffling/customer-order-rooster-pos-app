import 'dart:convert';
import 'dart:math';
// ignore: library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

import '../constants/constant_app.dart';
import '../constants/firebase.dart';
import '../entity/item.dart';
import '../models/bill_model.dart';
import '../models/model_table_order.dart';
import '../models/process_model.dart';
import '../models/product_model.dart';
import '../models/table_callback_model.dart';

class ProductsController extends GetxController {
  static ProductsController instance = Get.find();
  //late AppDatabase appDatabase;
  RxList<ProductItem> products = RxList<ProductItem>([]);
  RxList<ProductModel> orderItems = <ProductModel>[].obs;
  RxList<ProductModel> productsNew = RxList<ProductModel>([]);
  RxList<OrderTableModel> tableBills = RxList<OrderTableModel>([]);
  RxList<ProcessModel> processList = RxList<ProcessModel>([]);
  Rx<ProcessModel> dataProcess = ProcessModel('', '', false).obs;
  OrderTableModel tempBills = OrderTableModel("0", "0", []);
  List<OrderDetailTable> tempListAll =
      List.filled(0, OrderDetailTable('0', '0', '0'));
  TotalBillModel totalBill = TotalBillModel(
      id: 0,
      totalcash: '',
      payment: '',
      tid: '',
      seat: '',
      orderdetail: [],
      checkintime: '',
      checkouttime: '');
  RxInt dismissed_count = 0.obs;
  RxDouble sumPrice = 0.0.obs;
  RxDouble subPrice = 0.0.obs;
  RxBool isConfirm = false.obs;
  RxInt orderLength = 0.obs;

  RxList<CallBackTable> callbackList = RxList<CallBackTable>(
    [
      CallBackTable(table: 'T1', isReached: false),
      CallBackTable(table: 'T2', isReached: false),
      CallBackTable(table: 'T3', isReached: false),
      CallBackTable(table: 'T4', isReached: false),
      CallBackTable(table: 'T5', isReached: false),
      CallBackTable(table: 'T6', isReached: false),
      CallBackTable(table: 'T7', isReached: false),
      CallBackTable(table: 'T8', isReached: false),
      CallBackTable(table: 'T9', isReached: false),
      CallBackTable(table: 'Home', isReached: false),
    ],
  );
  // RxList<CallBackTable> callbackList = RxList<CallBackTable>([]);

  var productCollection = "products";
  var billCollection = "bills";
  var formatter = NumberFormat('#,###,##0');

  @override
  void onInit() {
    // appDatabase = Get.find();
    //  deleteAllItem();
    //addDatafrJson();
    loadData();
    createAllTable();
    //loadData();
    //printInfo(printFunction: loadData);
    // for (var element in products) {
    //   logger.i({"Products": element.toString()});
    // }
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    productsNew.bindStream(getAllProducts());

    // readTable().then((value) {
    //   callbackList.addAll(value);
    //   callbackList.forEach((element) {
    //     logger.i({"callbackList:": element.isReached});
    //   });
    // });
    // logger.i({"productsNew ": productsNew.length});
  }

  void createAllTable() {
    for (int i = 0; i < 9; i++) {
      OrderTableModel tempBills = OrderTableModel((i + 1).toString(), "0", []);
      tableBills.add(tempBills);
    }
  }

  void addOrderToTable(String table, String seat) {
    tableBills.forEach((element) {
      if (element.tid == table) {
        element.seat = seat;
        element.orderList = orderItems.toList();
        logger.i({"LIST ": element.orderList.length});
      }
    });
    // logger.i({"TABLE ": table});
    // logger.i({"SEAT ": seat});
    // logger.i({"LIST_1 ": tableBills.first});
  }

  // List<String> poreIDList(List<String> tempList) {
  //   List<String> numList = [];
  //   for (var i = 0; i < tempList.length; i++) {
  //     numList.add((i).toString());
  //   }
  //   // logger.i({"IDDDDDDDDDDDDDDDD ": numList});
  //   return numList;
  // }

  // List<String> poreOrderList(String id) {
  //   List<String> tempList = [];
  //   tableBills.forEach((element) {
  //     if (element.tid == id) {
  //       element.orderList.forEach((e) {
  //         tempList.add(e.name);
  //       });
  //     }
  //   });
  //   return tempList;
  // }

  // List<String> poreProgressList(String id) {
  //   List<String> tempList = [];
  //   tableBills.forEach((element) {
  //     if (element.tid == id) {
  //       element.orderList.forEach((e) {
  //         tempList.add(e.count.toString());
  //       });
  //     }
  //   });
  //   return tempList;
  // }

  OrderTableModel populateDatatoTable(String id) {
    for (var element in tableBills) {
      if (element.tid == id) {
        return element;
      }
    }
    return OrderTableModel('', '', []);
  }

  List<ProcessModel> dataProcessStored(String tid) {
    List<ProcessModel> temp = [];
    tableBills.forEach((element) {
      if (element.tid == tid) {
        for (var i in element.orderList) {
          temp.add(ProcessModel('', '', false));
        }
        for (var iterate = 0; iterate < temp.length; iterate++) {
          temp.elementAt(iterate).name =
              element.orderList.elementAt(iterate).name;
          temp.elementAt(iterate).tid = 'T${element.tid}';
          callbackList.forEach((element) {
            if (element.table == temp.elementAt(iterate).tid) {
              temp.elementAt(iterate).status = element.isReached;
            }
          });
        }
      }
    });
    return temp;
  }

  // int getLengthOfProcessList() {
  //   var index = 0;
  //   processList.forEach((element) {
  //     index = element.orderList.length;
  //   });
  //   return index;
  // }

  // OrderTableModel addOrderToProcess() {
  //   for (var element in processList) {
  //     return element;
  //   }
  //   return OrderTableModel('', '', []);
  // }

  // void addOrderToProcess() {
  //   processList.addAll(tableBills);
  //   logger.i({"LÍTTTTTT ": processList});
  // }
  // List<OrderDetailTable> poreDatatoTable(String id) {
  //   final idList_ = <String>[];
  //   final ordertableList_ = <String>[];
  //   final progressList_ = <String>[];
  //   tableBills.forEach((element) {
  //     if (element.tid == id) {
  //       element.orderList.forEach((e) {
  //         idList_.add(e.id);
  //         ordertableList_.add(e.name);
  //         progressList_.add(e.count.toString());

  //         logger.i({"orderTABLE ": idList_});
  //         logger.i({"orderTABLE ": ordertableList_});
  //         logger.i({"orderTABLE ": progressList_});
  //       });
  //     }
  //   });

  //   // final List<OrderDetailTable> tempList =
  //   //     List.filled(idList_.length, OrderDetailTable('', '', ''));
  //   tempListAll = List.filled(idList_.length, OrderDetailTable('', '', ''));
  //   for (var i = 0; i < idList_.length; i++) {
  //     tempListAll.elementAt(i).id = idList_.elementAt(i);
  //     tempListAll.elementAt(i).list_order = ordertableList_.elementAt(i);
  //     tempListAll.elementAt(i).progress = progressList_.elementAt(i);
  //     logger.i({"ID ": tempListAll.elementAt(i).id});
  //     logger.i({"PRODUCT ": tempListAll.elementAt(i).list_order});
  //   }
  //   logger.i({"LENGTH ": tempListAll.length});

  //   for (var i = 0; i < idList_.length; i++) {
  //     logger.i({"ID ": tempListAll.elementAt(i).id});
  //     logger.i({"PRODUCT ": tempListAll.elementAt(i).list_order});
  //   }
  //   return tempListAll;
  // }

  ProductItem removeCount(RxInt count, ProductItem item) {
    item.count -= count.toInt();
    return item;
  }

  void summaryItemPrice(double item) {
    sumPrice.value += item;
    logger.i({"Summary": sumPrice});
  }

  void subItemPrice(double item) {
    sumPrice.value -= item;
    if (sumPrice.value <= 0) {
      sumPrice.value = 0.0;
    }
    logger.i({"Final": sumPrice});
  }

  void resetItemPrice() {
    sumPrice.value = 0;
    subPrice.value = 0;
  }

  void addItemOrder(ProductModel item) {
    if (_checkOrderItem(item)) {
      for (var i in orderItems) {
        if (i.id == item.id) {
          i.count++;
          summaryItemPrice(item.price);
          orderItems.add(item);
          // orderLength.value += orderItems.length;
          // logger.i({"LENGTHHHHHHHH": orderLength.value});
          orderItems.removeLast();
        }
      }
    } else {
      orderItems.add(item);
      summaryItemPrice(item.price);
    }
  }

  bool _checkOrderItem(ProductModel item) {
    bool flag = false;
    for (var i in orderItems) {
      if (i.id == item.id) {
        flag = true;
        return flag;
      }
    }
    return flag;
  }

  // RxList<ProductItem> getAllItemsByCategory(String category) {
  //   Future<List<ProductItem>> productItemByCtg =
  //       appDatabase.itemDAO.getAllItemsByCategory(category);
  //   RxList<ProductItem> itemsCtg = RxList<ProductItem>([]);
  //   productItemByCtg.then((value) => itemsCtg.addAll(value));
  //   return itemsCtg;
  // }

  RxList<ProductModel> getAllItemsByCategory(String category) {
    RxList<ProductModel> itemsCtg = RxList<ProductModel>([]);
    for (var value in productsNew) {
      if (value.category == category) {
        itemsCtg.add(value);
      }
    }
    return itemsCtg;
  }

  void loadData() {
    //appDatabase.itemDAO.getAllItems().then((value) => products.addAll(value));
    readJsonDatabase().then((value) {
      products.addAll(value);
      //items.addAll(value);
    });
    retrieveProduct().then((value) {
      productsNew.addAll(value);
      //items.addAll(value);
    });
    readTable();
    // readTable().then((value) {
    //   callbackList.addAll(value);
    //   callbackList.forEach((element) {
    //     logger.i({"callbackList:": element.isReached});
    //   });
    // });
    //products.bindStream(appDatabase.itemDAO.getAllItems().asStream());
    logger.i({"Products": products.length});
    //productsNew.bindStream(getAllProducts());
    logger.i({"productsNew ": productsNew.length});
  }

  // void addDatafrJson() {
  //   //final List<ProductItem> items = [];
  //   readJsonDatabase().then((value) {
  //     for (ProductItem item in value) {
  //       appDatabase.itemDAO.insertItem(item);
  //       logger.i({"Items": item.toString()});
  //     }
  //     //items.addAll(value);
  //   });
  //   //logger.i({"Item11": items.length});
  // }

  Future<List<ProductItem>> readJsonDatabase() async {
    final rawData =
        await rootBundle.rootBundle.loadString('assets/data/virtual_item.json');
    logger.i({"rawData": rawData.toString()});
    List<dynamic> list = jsonDecode(rawData);
    List<ProductItem> pItem = List<ProductItem>.from(
        list.map<ProductItem>((model) => ProductItem.fromJson(model)));
    // for (var item in pItem) {
    //   logger.i({"list": item.toString()});
    // }

    return pItem;
  }

  Stream<List<ProductModel>> getAllProducts() => firebaseFirestore
      .collection(productCollection)
      .snapshots()
      .map((query) => query.docs
          .map((item) => ProductModel.fromJson(item.data()))
          .toList());

  Future<List<ProductModel>> retrieveProduct() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firebaseFirestore.collection(productCollection).get();
    return snapshot.docs
        .map((docSnapshot) => ProductModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  void createBill(OrderTableModel order) {
    totalBill.seat = order.seat;
    totalBill.tid = order.tid;
    totalBill.orderdetail = order.orderList;
    totalBill.payment = "Cash";
    totalBill.totalcash = calculateTotalCash(order.orderList).toString();
    totalBill.checkintime = "";
    totalBill.checkouttime = "";
  }

  double calculateTotalCash(List<ProductModel> orderList) {
    double total = 0.0;
    for (var i in orderList) {
      total += i.price;
    }
    return total * 0.1 + total;
  }

  void createOrUpdateBillData(OrderTableModel order) async {
    //DocumentReference<Map<String, dynamic>> ref =
    createBill(order);
    Map<String, dynamic> billMap = totalBill.getTotalBillMap();
    await firebaseFirestore.collection(billCollection).add(billMap);
  }

  void deleteAllItem() {
    //appDatabase.itemDAO.deleteAllItem();
  }

  void readTable() {
    List<CallBackTable> tableCallback = [];
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('table');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      logger.i({"realtime ": data.toString()});
      final map = data as Map<dynamic, dynamic>;
      logger.i({"mapdata ": map.toString()});
      callbackList.forEach((element) {
        logger.i({"callbackList:": element.isReached});
      });
      callbackList.clear();
      map.forEach((key, value) {
        final callback = CallBackTable.fromMap(value);
        logger.i({"callback ": callback.isReached});
        callbackList.add(callback);
      });
      callbackList.forEach((element) {
        logger.i({"callbackList:": element.isReached});
      });

      // logger.i({"tableCallback:": tableCallback[1].isReached});
      // logger.i({"callbackListMapped:": callbackList.value[1].isReached});
      // callbackList.addAll(tableCallback);
      // callbackList.forEach((element) {
      //   logger.i({"callbackListMapped:": element.isReached});
      // });
      logger.i({"Ngu vllllll"});

      // logger.i({"callbackList ": callbackList[0]});
    });
    // return tableCallback;
  }

  final List<CallBackTable> list = [];

  void readTableCallback() async {
    final snapshot = await FirebaseDatabase.instance.ref('table');
    final snap = snapshot.get();
    final map = snap as Map<dynamic, dynamic>;
    snapshot.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      logger.i({"realtime ": data.toString()});
      map.forEach((key, value) {
        final user = CallBackTable.fromMap(value);

        list.add(user);

        logger.i({"realtimeList ": list.toString()});
      });
    });
  }

  Future<void> changeTableStatus(
      String table, bool isReach, bool isActivated) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("table/$table");
    await ref.update({"isReached": isReach, "isActivated": isActivated});
  }
}
