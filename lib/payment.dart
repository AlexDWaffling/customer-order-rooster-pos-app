import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application_for_service_robot/home.dart';
import 'package:pos_application_for_service_robot/main.dart';

import 'controllers/productController.dart';
import 'models/model_numpad.dart';
import 'models/model_payment_method_proper.dart';
import 'models/model_table.dart';
import 'widgets/cash_charge.dart';
import 'widgets/item_bar.dart';
import 'widgets/qr_charge.dart';

List paymentMethod = [
  ["CASH", Icons.money],
  ["MOMO", Icons.money],
  ["VNPAY", Icons.money],
  ["OTHER", Icons.money],
  ["Back", Icons.arrow_back]
];

class PaymentPage extends StatefulWidget {
  PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

paymentMethodProperties changePaymentMethod(String method) {
  final ProductsController _productsController = Get.put(ProductsController());
  final NumPadModel _numpad = Get.put(NumPadModel());
  paymentMethodProperties methodCallback =
      paymentMethodProperties('', Colors.white, '');
  if (_numpad.medthodPayment.value == 'MOMO' || method == 'MOMO') {
    methodCallback.imageUrl = 'assets/qr/momo.png';
    methodCallback.subtitle = 'Phone Number : +84911920650';
    methodCallback.color = Color.fromRGBO(165, 1, 100, 1);
  } else if (_numpad.medthodPayment.value == 'VNPAY' || method == 'VNPAY') {
    methodCallback.imageUrl = 'assets/qr/vnpay.png';
    methodCallback.subtitle = 'Tien Phong Bank : 20911920402';
    methodCallback.color = Color.fromRGBO(123, 53, 187, 1);
  } else if (_numpad.medthodPayment.value == 'CASH' || method == 'CASH') {
    methodCallback.imageUrl = 'assets/qr/momo.png';
    methodCallback.subtitle =
        'Cash Back: ${_productsController.formatter.format(_numpad.cashBack.value)} VND';
    methodCallback.color = Color.fromRGBO(62, 98, 59, 1);
  } else if (_numpad.medthodPayment.value == 'OTHER' || method == 'OTHER') {
    methodCallback.imageUrl = 'assets/qr/momo.png';
    methodCallback.subtitle = 'Phone Number : +84911920650';
    methodCallback.color = Color.fromRGBO(248, 184, 0, 1);
  }
  return methodCallback;
}

class _PaymentPageState extends State<PaymentPage> {
  final ProductsController _productsController = Get.put(ProductsController());
  final NumPadModel _numpad = Get.put(NumPadModel());
  @override
  Widget build(BuildContext context) {
    String getMethod = _numpad.medthodPayment.value;
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                height: 120,
                color: changePaymentMethod(getMethod).color,
                child: Center(
                  child: Text('${getMethod} QR SCAN',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 100,
                          color: Color.fromRGBO(255, 255, 255, 1))),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                height: 1,
                color: Color.fromRGBO(226, 224, 224, 1),
              ),
              // Center(
              //   child: Container(
              //     width: 600,
              //     height: 600,
              //     decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 255, 255, 255),
              //       // shape: BoxShape.rectangle,
              //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //       border: Border.all(
              //           width: 1.0, color: Color.fromRGBO(200, 200, 200, 1)),
              //     ),
              //     child: Center(
              //       child: Image.asset(
              //         changePaymentMethod(getMethod).imageUrl,
              //         width: 600,
              //         height: 600,
              //         scale: 0.5,
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Builder(builder: (BuildContext context) {
                    if (getMethod == 'CASH' || getMethod == 'OTHER') {
                      return cashCharge(
                          method: changePaymentMethod(getMethod).imageUrl);
                    } else {
                      return qrCharge(
                          method: changePaymentMethod(getMethod).imageUrl);
                    }
                  })
                  // cashCharge(method: changePaymentMethod(getMethod).imageUrl),
                  ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                height: 1,
                color: Color.fromRGBO(226, 224, 224, 1),
              ),
              Container(
                height: 100,
                color: changePaymentMethod(getMethod).color,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(
                          width: 1.0, color: Color.fromRGBO(195, 195, 195, 1)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Nguyen Trong Nhan',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                              color: Color.fromRGBO(18, 19, 25, 1))),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Container(
                  height: 60,
                  color: changePaymentMethod(getMethod).color,
                  child: Center(
                    child: Text(changePaymentMethod(getMethod).subtitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromRGBO(226, 224, 224, 1))),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 300),
          child: SizedBox(
            width: 100,
            height: double.infinity,
            child: Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return itemBar(
                      menu: paymentMethod[index][0],
                      icon: paymentMethod[index][1],
                      tap_state: () {
                        setState(() {
                          if (paymentMethod[index][0] != 'Back') {
                            getMethod = paymentMethod[index][0];
                          } else {}
                        });
                      },
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
