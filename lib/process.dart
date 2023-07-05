import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/constant_app.dart';
import 'controllers/productController.dart';
import 'models/model_table.dart';
import 'models/model_table_order.dart';
import 'widgets/table_order_list.dart';
import 'widgets/table_order_list_process.dart';

class ProcessPage extends StatefulWidget {
  ProcessPage({super.key});

  @override
  State<ProcessPage> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  final ProductsController _productsController = Get.put(ProductsController());

  final TableModel _table = Get.put(TableModel());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        tableOrderListProcess(
          id: 'ID',
          table_name: 'Table Name',
          list_name: 'List Order',
          progress: 'Progress',
          isTitle: true,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          enter: () {},
          status: false,
        ),
        Expanded(
          child: Obx(
            () => ListView.builder(
                itemCount: _productsController.processList.length,
                itemBuilder: (context, index) {
                  _productsController.processList.forEach((element) {
                    logger.i({"Nameeeeee ": element.name});
                  });
                  return tableOrderListProcess(
                    id: index.toString(),
                    table_name: _productsController.processList[index].tid,
                    list_name: _productsController.processList[index].name,
                    progress: "",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    isTitle: false,
                    status: _productsController.processList[index].status,
                    enter: () {
                      setState(() {
                        logger.i({
                          "ProcessListtttt ":
                              _productsController.processList[index].tid
                        });
                        _productsController.changeTableStatus(
                            _productsController.processList[index].tid,
                            false,
                            true);
                      });
                    },
                  );
                }),
          ),
        ),
      ],
    ));
  }
}
