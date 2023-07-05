import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application_for_service_robot/entity/order.dart';

import '../constants/constant_app.dart';
import '../controllers/productController.dart';
import '../entity/item.dart';
import '../models/product_model.dart';
import 'item_order.dart';

class itemOrderS extends StatefulWidget {
  const itemOrderS({super.key});
  @override
  State<itemOrderS> createState() => _itemOrderSState();
}

class _itemOrderSState extends State<itemOrderS> {
  final ProductsController _productsController = Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          itemCount: _productsController.orderItems.length,
          itemBuilder: (context, index) {
            ProductModel order = _productsController.orderItems[index];
            for (var item in _productsController.orderItems) {
              logger.i({"Count ": item.count});
            }
            return itemOrder(
              image: order.image,
              title: order.name,
              price:
                  '${_productsController.formatter.format((order.price * order.count).toInt())} VND',
              qty: order.count.toString(),
              dismiss_del: (context) {
                setState(() {
                  _productsController.orderItems.removeAt(index);
                  _productsController.subItemPrice(order.price * order.count);
                  order.count = 1;
                });
              },
              dismiss: () {
                setState(() {
                  _productsController.orderItems.removeAt(index);
                  _productsController.subItemPrice(order.price * order.count);
                  order.count = 1;
                });
              },
              counter_plus: () {
                setState(() {
                  order.count += 1;
                  _productsController.summaryItemPrice(order.price);
                });
              },
              counter_minus: () {
                setState(() {
                  order.count -= 1;
                  if (order.count == 0) {
                    _productsController.orderItems.removeAt(index);
                    _productsController.subItemPrice(order.price);
                    order.count = 1;
                  } else {
                    _productsController.subItemPrice(order.price);
                  }
                });
              },
            );
          }),
    );
  }
}
