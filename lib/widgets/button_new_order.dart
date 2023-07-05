import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant_app.dart';
import '../controllers/productController.dart';
import '../models/model_numpad.dart';
import '../models/model_table.dart';

class btnNewOrder extends StatefulWidget {
  const btnNewOrder({super.key});

  @override
  State<btnNewOrder> createState() => _btnNewOrderState();
}

class _btnNewOrderState extends State<btnNewOrder> {
  final ProductsController _productsController = Get.put(ProductsController());
  final NumPadModel _numpad = Get.put(NumPadModel());
  final TableModel _table = Get.put(TableModel());
  Color _colorTextNon = Colors.white;
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      _colorTextNon = Colors.white;
      _exitCounter++;
    });
  }

  void _updateTextColor(PointerEvent details) {
    _colorTextNon = Color.fromRGBO(18, 19, 25, 1);
    x = details.position.dx;
    y = details.position.dy;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      // width: 80,
      child: MouseRegion(
        onHover: _updateTextColor,
        onEnter: _incrementEnter,
        onExit: _incrementExit,
        child: FloatingActionButton(
            onPressed: () {
              setState(() {
                // _productsController.addOrderToTable(
                //   _numpad.count_t.toString(),
                //   _numpad.count_s.toString(),
                // );
                _productsController.orderItems.clear();
                _productsController.resetItemPrice();
                _numpad.updateNewValue();
                // _table.updateNewValue();
                // logger.i({"NGU VL"});
                // logger.i({"TABLE ID ": _numpad.tableString});
                // logger.i({"SEAT CODE ": _numpad.seatString});
              });
            },
            hoverColor: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(18)),
            backgroundColor: Color.fromRGBO(18, 19, 25, 1),
            elevation: 0,
            child: Text(
              'Clear',
              style: TextStyle(
                color: _colorTextNon,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }
}
