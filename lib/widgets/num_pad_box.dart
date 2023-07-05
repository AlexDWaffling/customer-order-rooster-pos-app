import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant_app.dart';
import '../models/model_numpad.dart';
import 'num_pad.dart';

class NumPadBox extends StatelessWidget {
  final String name;
  // ignore: prefer_typing_uninitialized_variables
  final tap;
  // ignore: prefer_typing_uninitialized_variables
  var color;

  final int index;

  NumPadBox(
      {super.key,
      required this.name,
      this.color,
      required this.index,
      this.tap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: tap,
      hoverColor: Color.fromRGBO(226, 224, 224, 1),
      shape: BeveledRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(150, 150, 150, 1), width: 0.1),
          borderRadius: BorderRadius.circular(3.0)),
      backgroundColor: color,
      elevation: 0,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(
              color: Color.fromRGBO(18, 19, 25, 1),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      // borderSide: BorderSide(color: color),
    );
  }
}
