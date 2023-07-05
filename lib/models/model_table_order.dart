import 'package:get/get.dart';

import 'product_model.dart';

class OrderTableModel {
  late String tid;
  late String seat;
  late List<ProductModel> orderList;
  OrderTableModel(
    this.tid,
    this.seat,
    this.orderList,
  );
}

class OrderDetailTable {
  late String id;
  late String list_order;
  late String progress;
  OrderDetailTable(
    this.id,
    this.list_order,
    this.progress,
  );
}
