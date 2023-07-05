import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvanceListBar extends GetxController {
  final RxList advance_list_bar = [
    //[name, icon]
    ["Income Commonly", Icons.arrow_drop_down, false],
    ["Daily Bills Report", Icons.arrow_drop_down, false],
    ["Item in Storage", Icons.arrow_drop_down, false],
    ["Statistical List", Icons.arrow_drop_down, false],
    ["Manage Personel", Icons.arrow_drop_down, false],
    ["Robot Status", Icons.arrow_drop_down, false],
  ].obs;

  final RxList daily_bills_report = [
    //[name, icon]
    ["Today"],
    ["This Week"],
    ["This Month"],
    ["This Year"]
  ].obs;
}
