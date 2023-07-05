// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/model_advance_bar.dart';

class AdvanceListBarMain extends StatelessWidget {
  // String expandedValue;
  // String headerValue;
  // bool isExpanded;
  // AdvanceListBarMain(
  //     {super.key,
  //     required this.expandedValue,
  //     required this.headerValue,
  //     required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    final AdvanceListBar _advanceListBar = Get.put(AdvanceListBar());
    return ListView.builder(
        itemCount: _advanceListBar.advance_list_bar.length,
        itemBuilder: (context, index) {
          return Text(
            '$_advanceListBar.advance_list_bar[index][0]',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Color.fromRGBO(18, 19, 25, 1)),
          );
        });
  }
}
