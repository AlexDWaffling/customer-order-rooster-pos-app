import 'package:get/get.dart';

import '../constants/constant_app.dart';

class TableModel extends GetxController {
  RxList table_model = [
    //[number]
    1, 2, 3, 4, 5, 6, 7, 8, 9
  ].obs;
  RxList test_order = [
    ["Fish and haha", true],
    ["Fish and dog", true],
    ["Fish and cat", false],
    ["Fish and hihi", false],
    ["Fish and hihi", false],
    ["Fish and hihi", false],
    ["Fish and hihi", false],
  ].obs;

  RxList table_order_callback = [
    ["T1", true],
    ["T2", true],
    ["T3", true],
    ["T4", true],
    ["T5", true],
    ["T6", true],
    ["T7", true],
    ["Home", true],
  ].obs;
  RxList table_order_callback_reset = [
    ["T1", false],
    ["T2", false],
    ["T3", false],
    ["T4", false],
    ["T5", false],
    ["T6", false],
    ["T7", false],
    ["Home", false],
  ].obs;
  RxInt table_number = 0.obs;
  RxInt table_number_detail = 1.obs;
  RxInt table_seat_detail = 0.obs;
  RxInt table_temp = 0.obs;
  // ignore: non_constant_identifier_names
  void None() {
    logger.i({"table num:", table_number});
  }

  void updateNewValue() {
    table_temp.value = 0;
    // update();
  }
}
