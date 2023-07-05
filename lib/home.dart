import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos_application_for_service_robot/payment.dart';
import 'package:provider/provider.dart';

import 'constants/constant_app.dart';
import 'constants/controllers.dart';
import 'controllers/productController.dart';
import 'entity/item.dart';
import 'models/model_numpad.dart';
import 'models/model_tab.dart';
import 'models/model_table.dart';
import 'models/product_model.dart';
import 'page/cocktail.dart';
import 'page/drink.dart';
import 'page/main_dish.dart';
import 'page/side_dish.dart';
import 'page/wine.dart';

import 'widgets/button_clear_order.dart';
import 'widgets/button_new_order.dart';
import 'widgets/item_order_state.dart';
import 'widgets/item_tab.dart';
import 'widgets/notify_dialog.dart';
import 'widgets/num_pad_pop.dart';
import 'widgets/payment_dropdown.dart';
import 'widgets/search_bar.dart';
import 'widgets/top_title.dart';
import 'widgets/top_title_restaurant.dart';

class HomePage extends StatefulWidget {
  // List<ProductItem> cItem = [];
  const HomePage({key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductsController _productsController = Get.put(ProductsController());
  final TableModel _table = Get.put(TableModel());
  final NumPadModel _numpad = Get.put(NumPadModel());
  final ItemModelTab _itemModelTab = Get.put(ItemModelTab());
  // final OrderController _orderController = Get.put(OrderController());
  List<ProductModel> cItem = [];
  double totalPrice = 0.0;
  String payment_ = '';
  var payment_method = ['Cast', 'Momo', 'VNPay'];
  // _HomePageState(this.cItem);

  DateTime now = DateTime.now();

  void collectItem(ProductModel _productItem) {
    setState(() {
      cItem.add(_productItem);
    });
  }

  String pageActive = 'Main Dish';
  _tabpageView() {
    switch (pageActive) {
      case 'Main Dish':
        return mainDishTab(cItem: cItem, getFunc: collectItem);
      case 'Side Dish':
        return sideDishTab(cItem: cItem, getFunc: collectItem);
      case 'Drink':
        return drinkTab(cItem: cItem, getFunc: collectItem);
      case 'Cocktail':
        return cocktailTab(cItem: cItem, getFunc: collectItem);
      case 'Wine':
        return wineTab(cItem: cItem, getFunc: collectItem);

      default:
        return mainDishTab(cItem: cItem, getFunc: collectItem);
    }
  }

  _setTabPage(String page) {
    setState(() {
      pageActive = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEEEE, dd - MMM - yyyy').format(now);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 14,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: topTitleRes(
                        title: 'Rooster Restaurant Menu',
                        subTitle: formattedDate),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 65,
                      child: Obx(
                        () => GridView.builder(
                            itemCount: _itemModelTab.main_items_tab.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5, childAspectRatio: 5 / 1),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: itemTab(
                                    icon: _itemModelTab.main_items_tab[index]
                                        [1],
                                    title: _itemModelTab.main_items_tab[index]
                                        [0],
                                    isActive: false,
                                    tap: () {
                                      _setTabPage(_itemModelTab
                                          .main_items_tab[index][0]);
                                    }),
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(child: _tabpageView()),
            ],
          ),
        ),
        // Expanded(flex: 1, child: Container()),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          width: 1,
          height: double.infinity,
          color: Color.fromRGBO(226, 224, 224, 1),
        ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(18, 19, 25, 1),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Obx(
                        () => topTitle(
                          title: ' Order',
                          subTitle:
                              'Table: ${(_table.table_number.toInt() != 0) ? _table.table_number : _numpad.count_t.toInt()}',
                          sideTitle: ' Seat: ${_numpad.count_s}',
                          action: Container(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 3, child: Container()),
                  Expanded(child: btnNewOrder()),
                  // Column(
                  //   children: [
                  //     btnNewtOrder(),
                  //     const SizedBox(height: 5),
                  //     btnClearOrder(),
                  //     // Expanded(child: btnResetOrder()),
                  //   ],
                  // )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(child: itemOrderS()),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        width: 1.0, color: Color.fromRGBO(226, 224, 224, 1)),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sub Total (VND)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                          Obx(
                            () => Text(
                              _productsController.formatter.format(
                                  producsController.sumPrice.toDouble()),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(18, 19, 25, 1)),
                            ),
                          ),
                        ],
                      ),
                      Expanded(flex: 1, child: Container()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Tax (VAT)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                          Text(
                            '10%',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                        ],
                      ),
                      Expanded(flex: 1, child: Container()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Voucher',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                          Text(
                            '0%',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                        ],
                      ),
                      Expanded(flex: 1, child: Container()),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        height: 2,
                        width: double.infinity,
                        color: Color.fromRGBO(18, 19, 25, 1),
                      ),
                      Expanded(flex: 1, child: Container()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(18, 19, 25, 1)),
                          ),
                          Obx(
                            () => Text(
                              _productsController.formatter.format(
                                  (producsController.sumPrice.toDouble()) +
                                      (producsController.sumPrice.toDouble() *
                                          0.1)),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(18, 19, 25, 1)),
                            ),
                          ),
                        ],
                      ),
                      Expanded(flex: 1, child: Container()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: FloatingActionButton(
                              onPressed: () {
                                // setState(() {
                                //   _productsController.addOrderToTable(
                                //     _numpad.count_t.toString(),
                                //     _numpad.count_s.toString(),
                                //   );
                                // });
                                showDialog<String>(
                                    context: context,
                                    builder: (context) {
                                      return notifyDialog(
                                        image: 'assets/icons/warning.png',
                                        message:
                                            'Do you want to place this order?',
                                        leftButton: 'Confirm',
                                        rightButton: 'Cancel',
                                      );
                                    });
                              },
                              hoverColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(18)),
                              backgroundColor: Color.fromRGBO(18, 19, 25, 1),
                              elevation: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.add_shopping_cart, size: 16),
                                  SizedBox(width: 6),
                                  Text('Place Order')
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  // logger.i({
                                  //   "id_table+++++++ ":
                                  //       _table.table_number_detail
                                  // });
                                  // logger.i({
                                  //   "size_table+++++++ ": _productsController
                                  //       .tableBills.first.orderList.length
                                  // });
                                  // _productsController.createOrUpdateBillData(
                                  //     _productsController.tableBills.elementAt(
                                  //         _table.table_number_detail.toInt() -
                                  //             1));
                                  showDialog<String>(
                                      context: context,
                                      builder: (context) {
                                        return notifyDialog(
                                          image: 'assets/icons/warning.png',
                                          message:
                                              'Do you want to call our waiter?',
                                          leftButton: 'Yes',
                                          rightButton: 'Cancel',
                                        );
                                      });
                                });
                              },
                              hoverColor: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(18)),
                              backgroundColor: Color.fromRGBO(18, 19, 25, 1),
                              elevation: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.payment, size: 16),
                                  SizedBox(width: 6),
                                  Text('Call')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
