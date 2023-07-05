import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemModelTab extends GetxController {
  final RxList main_items_tab = [
    //[name, icon]
    ["Main Dish", Icons.rocket_sharp],
    ["Side Dish", Icons.format_list_bulleted_rounded],
    ["Drink", Icons.history_toggle_off_rounded],
    ["Cocktail", Icons.discount_outlined],
    ["Wine", Icons.wine_bar],
  ].obs;
}
