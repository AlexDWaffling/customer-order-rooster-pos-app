import 'package:get/get.dart';

import '../constants/constant_app.dart';

class NumPadModel extends GetxController {
  RxList numpad_model = [
    //[number]
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "OK", "0", "DEL"
  ].obs;

  RxList numpad_model_cal = [
    //[number]
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "00", "000", "CAL", " ",
    "DEL"
  ].obs;
  RxInt count_t = 0.obs;
  RxInt count_s = 0.obs;
  RxString tableString = ''.obs;
  RxString seatString = ''.obs;
  RxString resultStr = ''.obs;
  RxInt result = 0.obs;
  RxInt cashBack = 0.obs;
  RxString medthodPayment = 'CASH'.obs;

  void addNumberToTable(String num) {
    tableString.value += num;
    count_t.value = int.parse(tableString.toString());
    if (count_t.value > 9) {
      count_t.value = 0;
      tableString.value = '';
    }
    logger.i({"table:", count_t});
  }

  void addMoneyReceive(String num) {
    if (num != 'DEL' || num != 'CAL') {
      resultStr.value += num;
      result.value = int.parse(resultStr.toString());
      logger.i({"result:", result});
    }
  }

  void addNumberToSeat(String num) {
    seatString.value += num;
    count_s.value = int.parse(seatString.toString());
    if (count_s.value > 10) {
      count_s.value = 0;
      seatString.value = '';
    }
    logger.i({"table:", count_s});
  }

  void updateNewValue() {
    count_t.value = 0;
    count_s.value = 0;
    tableString.value = '';
    seatString.value = '';
    update();
  }

  void cashBackFunc(double total, int receive) {
    cashBack.value = receive - total.toInt();
    logger.i({"cashBack:", cashBack.value});
  }

  void clearResult() {
    resultStr.value = '';
    result.value = 0;
    cashBack.value = 0;
  }
}
