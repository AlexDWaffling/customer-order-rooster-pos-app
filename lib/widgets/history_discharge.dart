import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/productController.dart';
import '../models/model_history.dart';
import 'history_day.dart';

class HistoryDischarge extends StatelessWidget {
  bool isActive_;
  HistoryDischarge({super.key, required this.isActive_});

  @override
  Widget build(BuildContext context) {
    final HistoryModel _historyDayModel = Get.put(HistoryModel());
    return Obx(() => Visibility(
        maintainSize: false,
        maintainAnimation: true,
        maintainState: true,
        visible: isActive_,
        child: Row(
          children: [
            SizedBox(
              width: 300,
              child: ListView.builder(
                  itemCount: _historyDayModel.day.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 3),
                      child: SizedBox(
                          height: 65.0 * _historyDayModel.dayList_1.length,
                          width: double.infinity,
                          // color: Colors.red,
                          child: hisDay(
                              dateTime:
                                  _historyDayModel.day[index].toString())),
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              height: double.infinity,
              width: 1,
              color: Color.fromRGBO(226, 224, 224, 1),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  // color: Colors.white,
                  child: Center(
                    child: Text(
                      'REPORT',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromRGBO(18, 19, 25, 1)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 1,
                  width: double.infinity,
                  color: Color.fromRGBO(226, 224, 224, 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 5.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 1.0,
                            color: Color.fromRGBO(226, 224, 224, 1)),
                        color: Color.fromRGBO(255, 255, 255, 1)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40.0, bottom: 5.0, left: 30.0, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total Cash Income',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(100, 100, 100, 1)),
                              ),
                              Text(
                                'Total Discharge',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(100, 100, 100, 1)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '12.423.600 VND',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromRGBO(18, 19, 25, 1)),
                              ),
                              Text(
                                '6',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromRGBO(18, 19, 25, 1)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 5.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              width: 1.0,
                              color: Color.fromRGBO(226, 224, 224, 1)),
                          color: Color.fromRGBO(255, 255, 255, 1)),
                      child: Center(
                        child: Text(
                          'REPORT',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Color.fromRGBO(18, 19, 25, 1)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ],
        )));
  }
}
