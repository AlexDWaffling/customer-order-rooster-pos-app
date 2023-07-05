import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/constant_app.dart';
import 'controllers/productController.dart';
import 'main.dart';
import 'models/model_numpad.dart';
import 'models/model_table.dart';
import 'models/model_table_order.dart';
import 'widgets/table_frame_info.dart';
import 'widgets/table_order_list.dart';
import 'widgets/table_page_detail.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final TableModel _table = Get.put(TableModel());
  final ProductsController _productsController = Get.put(ProductsController());
  final NumPadModel _numpad = Get.put(NumPadModel());
  @override
  Widget build(BuildContext context) {
    OrderTableModel _orderTableModel = _productsController
        .populateDatatoTable(_table.table_number_detail.toString());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 220,
          // height: 660,
          child: Expanded(
            child: GridView.builder(
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 1),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: tablePageDetail(
                        name: _table.table_model[index],
                        tap: () {
                          setState(() {
                            _table.table_number_detail.value =
                                _table.table_model[index];
                          });
                        },
                        doubleTap: () {
                          _productsController.orderItems.value =
                              _orderTableModel.orderList;
                          _table.table_number = _table.table_number_detail;
                          _numpad.count_s.value = int.parse(_productsController
                              .tableBills
                              .elementAt(_table.table_number_detail.toInt() - 1)
                              .seat);
                          // Navigator.push(
                          //   context,
                          //   new MaterialPageRoute(
                          //       builder: (context) => new MyApp()),
                          // );

                          _productsController.changeTableStatus(
                              "${_table.table_order_callback[index][0]}",
                              false,
                              _table.table_order_callback[index][1]);
                        },
                      ));
                }),
          ),
        ),
        SizedBox(
          width: 676,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: Container(
                  width: 676,
                  height: 424,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    // shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(
                        width: 1.0, color: Color.fromRGBO(200, 200, 200, 1)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 676,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              _productsController.changeTableStatus(
                                  "${_table.table_order_callback.last[0]}",
                                  false,
                                  _table.table_order_callback.last[1]);
                            });
                          },
                          hoverColor: Color.fromARGB(255, 68, 195, 56),
                          backgroundColor: Color.fromRGBO(62, 98, 59, 1),
                          shape: BeveledRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromRGBO(150, 150, 150, 1),
                                  width: 0.1),
                              borderRadius: BorderRadius.circular(3.0)),
                          elevation: 0,
                          child: Center(
                            child: Text(
                              'Return Home',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 676,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              for (var i = 0; i < 9; i++) {
                                _productsController.changeTableStatus(
                                    "${_table.table_order_callback_reset[i][0]}",
                                    false,
                                    _table.table_order_callback_reset[i][1]);
                              }
                            });
                          },
                          hoverColor: Color.fromARGB(255, 248, 86, 37),
                          backgroundColor: Color.fromARGB(255, 255, 120, 80),
                          shape: BeveledRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromRGBO(150, 150, 150, 1),
                                  width: 0.1),
                              borderRadius: BorderRadius.circular(3.0)),
                          elevation: 0,
                          child: Center(
                            child: Text(
                              'Reset',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                        child: Center(
                          child: Text(
                            'ORDER DETAIL TABLE',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        height: 1,
                        // width: 200,
                        color: Color.fromRGBO(200, 200, 200, 1),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Center(
                                child: Text(
                                  'Table ${_table.table_number_detail}',
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(18, 19, 25, 1)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              child: Center(
                                child: Text(
                                  'Seat ${_productsController.tableBills.elementAt(_table.table_number_detail.toInt() - 1).seat}',
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(18, 19, 25, 1)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        height: 1,
                        color: Color.fromRGBO(200, 200, 200, 1),
                      ),
                      tableOrderList(
                        id: 'ID',
                        list_name: 'List Order',
                        progress: 'Progress',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: _orderTableModel.orderList.length,
                              itemBuilder: (context, index) {
                                return tableOrderList(
                                  id: index.toString(),
                                  list_name:
                                      _orderTableModel.orderList[index].name,
                                  progress: "100%",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                );
                              })),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 225,
                child: GridView.builder(
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 16.0, bottom: 6.0),
                          child: tablePageDetail(
                            name: _table.table_model[index + 3],
                            tap: () {
                              setState(() {
                                _table.table_number_detail.value =
                                    _table.table_model[index + 3];
                              });
                            },
                          ));
                    }),
              )
            ],
          ),
        ),
        SizedBox(
          width: 220,
          // height: 660,
          child: Expanded(
            child: GridView.builder(
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 1),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: tablePageDetail(
                        name: _table.table_model[8 - index],
                        tap: () {
                          setState(() {
                            _table.table_number_detail.value =
                                _table.table_model[8 - index];
                          });
                        },
                      ));
                }),
          ),
        ),
      ],
    );
  }
}
