import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant_app.dart';
import '../controllers/productController.dart';
import '../models/model_numpad.dart';
import 'num_pad.dart';
import 'num_pad_box.dart';

class cashCharge extends StatefulWidget {
  final String method;
  cashCharge({Key? key, required this.method}) : super(key: key);

  @override
  State<cashCharge> createState() => _cashChargeState();
}

class _cashChargeState extends State<cashCharge> {
  final NumPadModel _numpad = Get.put(NumPadModel());
  final ProductsController _productsController = Get.put(ProductsController());

  void switchBox(String content) {
    setState(() {
      if (content != 'DEL' && content != 'CAL') {
        _numpad.addMoneyReceive(content);
      }
      if (content == 'DEL') {
        _numpad.clearResult();
      } else if (content == 'CAL') {
        _numpad.cashBackFunc(
            (_productsController.sumPrice.toDouble()) +
                (_productsController.sumPrice.toDouble() * 0.1),
            _numpad.result.value);
            logger.i({"CODE Nhu CC"});
      }
      // logger.i({"test:", content});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => SizedBox(
          height: 622,
          width: 370,
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 39.0, vertical: 4.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      // shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(
                          width: 1.0, color: Color.fromRGBO(200, 200, 200, 1)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          'Total Bills: ${_productsController.formatter.format((_productsController.sumPrice.toDouble()) + (_productsController.sumPrice.toDouble() * 0.1))} VND',
                          style: const TextStyle(
                            color: Color.fromRGBO(18, 19, 25, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 39.0, vertical: 4.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  child: NumPadBox(
                    name:
                        'Received: ${_productsController.formatter.format(_numpad.result.value)} VND',
                    color: Color.fromRGBO(195, 195, 195, 1),
                    index: 1,
                    tap: () {},
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: SizedBox(
                width: 300,
                height: 500,
                child: Obx(
                  () => GridView.builder(
                      primary: false,
                      itemCount: _numpad.numpad_model_cal.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 1),
                      itemBuilder: (context, index) {
                        return NumPad(
                            name: '${_numpad.numpad_model_cal[index]}',
                            tap: () {
                              switchBox(_numpad.numpad_model_cal[index]);
                            });
                      }),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
