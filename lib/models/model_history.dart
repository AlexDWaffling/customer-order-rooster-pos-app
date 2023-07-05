import 'package:get/get.dart';

import '../constants/constant_app.dart';

class HistoryModel extends GetxController {
  //[ID, Total]
  RxList dayList_1 = [
    [1, "1.560.000"],
    [2, "763.000"],
    [3, "2.060.000"],
  ].obs;

  RxList dayList_2 = [
    [1, "560.000"],
    [2, "1.763.000"],
  ].obs;

  RxList Temp = [].obs;

  RxList day = [
    "12/02/2023",
    "13/02/2023",
    "14/02/2023",
    "15/02/2023",
    "16/02/2023",
    "17/02/2023",
  ].obs;
}
