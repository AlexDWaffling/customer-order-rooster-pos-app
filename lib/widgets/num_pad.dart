import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/model_numpad.dart';

class NumPad extends StatelessWidget {
  final String name;
  final tap;
  var _color = Color.fromARGB(240, 240, 240, 240);
  var _delcolor = Colors.deepOrangeAccent;
  var _okcolor = Colors.green;
  var _holdcolor = Color.fromRGBO(226, 224, 224, 1);
  var setbit = 0;
  NumPad({super.key, required this.name, this.tap});

  Color hoverColor_(int setbit) {
    if (setbit == 1) {
      return _delcolor;
    } else if (setbit == 2) {
      return _okcolor;
    } else {
      return _holdcolor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final NumPadModel _numpad = Get.put(NumPadModel());
    if (name == 'DEL') {
      _color = Color.fromRGBO(225, 225, 225, 1);
      setbit = 1;
    } else if (name == 'OK' || name == 'CAL') {
      _color = Color.fromRGBO(225, 225, 225, 1);
      setbit = 2;
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FloatingActionButton(
        onPressed: tap,
        hoverColor: hoverColor_(setbit),
        shape: BeveledRectangleBorder(
            side:
                BorderSide(color: Color.fromRGBO(150, 150, 150, 1), width: 0.1),
            borderRadius: BorderRadius.circular(3.0)),
        backgroundColor: _color,
        elevation: 0,
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromRGBO(18, 19, 25, 1)),
          ),
        ),
      ),
    );
  }
}
