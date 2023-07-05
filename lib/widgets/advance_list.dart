import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/model_advance_bar.dart';
import 'advance_list_detail.dart';

class AdvanceBar extends StatefulWidget {
  final tap;
  const AdvanceBar({super.key, this.tap});

  @override
  State<AdvanceBar> createState() => _AdvanceBarState();
}

class _AdvanceBarState extends State<AdvanceBar> {
  final AdvanceListBar _advanceListBar = Get.put(AdvanceListBar());
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          itemCount: _advanceListBar.advance_list_bar.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
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
                        Text(
                          _advanceListBar.advance_list_bar[index][0],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromRGBO(18, 19, 25, 1)),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                (_advanceListBar.advance_list_bar[index][2] !=
                                        isActive)
                                    ? _advanceListBar.advance_list_bar[index]
                                        [2] = isActive
                                    : _advanceListBar.advance_list_bar[index]
                                        [2] = !isActive;
                              });
                            },
                            child: Icon(
                                _advanceListBar.advance_list_bar[index][1])),
                      ],
                    ),
                  ),
                ),
                Visibility(
                    maintainSize: false,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: _advanceListBar.advance_list_bar[index][2],
                    child: SizedBox(
                        height: _advanceListBar.daily_bills_report.length * 37,
                        child: AdvanceListBarDetail(
                          tap: widget.tap,
                        )))
              ],
            );
          }),
    );
  }
}
