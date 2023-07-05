import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/model_advance_bar.dart';

class AdvanceListBarDetail extends StatelessWidget {
  final tap;
  const AdvanceListBarDetail({super.key, this.tap});
  @override
  Widget build(BuildContext context) {
    final AdvanceListBar _advanceListBar = Get.put(AdvanceListBar());
    return Obx(
      () => ListView.builder(
          itemCount: _advanceListBar.daily_bills_report.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: tap,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        width: 1.0, color: Color.fromRGBO(226, 224, 224, 1)),
                    color: Color.fromRGBO(255, 255, 255, 1)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          _advanceListBar.daily_bills_report[index][0],
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(100, 100, 100, 1)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
