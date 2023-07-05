import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/model_history.dart';
import 'history_table.dart';

class hisDay extends StatelessWidget {
  final String dateTime;

  hisDay({required this.dateTime});
  final HistoryModel _historyDayModel = Get.put(HistoryModel());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateTime,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(18, 19, 25, 1),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Obx(
            () => ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollawbleScrollPhysics(),
                itemCount: _historyDayModel.dayList_1.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: hisTable(
                        id: _historyDayModel.dayList_1[index][0],
                        total: _historyDayModel.dayList_1[index][1]),
                  );
                  // return hisTable(
                  //   id: 1,
                  //   total: '10000000',
                  // );
                }),
          ),
        )
      ],
    ));
  }
}
