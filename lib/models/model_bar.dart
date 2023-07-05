import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemModelBar extends GetxController {
  final RxList main_items_bar = [
    //[name, icon]
    ["Home", Icons.home_rounded],
    ["Table", Icons.table_restaurant],
    ["Process", Icons.play_circle],
    ["Payment", Icons.payment],
    ["Advance", Icons.restore],
    ["Settings", Icons.sports_soccer_outlined],
  ].obs;
}
