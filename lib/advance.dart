import 'package:flutter/material.dart';

import 'widgets/advance_list.dart';
import 'widgets/history_discharge.dart';

class AdvancePage extends StatefulWidget {
  const AdvancePage({super.key});

  @override
  State<AdvancePage> createState() => _AdvancePageState();
}

class _AdvancePageState extends State<AdvancePage> {
  bool setActive_ = false;
  bool temp = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 3,
                ),
                child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(
                          width: 1.0, color: Color.fromRGBO(226, 224, 224, 1)),
                    ),
                    child: Center(
                      child: Text(
                        'HAHAHAHAHA',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromRGBO(18, 19, 25, 1)),
                      ),
                    )),
              ),
            ),
            Expanded(
              child: SizedBox(
                  height: double.infinity,
                  width: 300,
                  // color: Colors.amber,
                  child: AdvanceBar(
                    tap: () {
                      setState(() {
                        (setActive_ != temp)
                            ? setActive_ = temp
                            : setActive_ = !temp;
                      });
                    },
                  )),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: double.infinity,
          width: 1,
          color: Color.fromRGBO(226, 224, 224, 1),
        ),
        Expanded(
          child: HistoryDischarge(
            isActive_: setActive_,
          ),
        ),
        // Expanded(
        //     child: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       height: 40,
        //       width: double.infinity,
        //       // color: Colors.white,
        //       child: Center(
        //         child: Text(
        //           'REPORT',
        //           style: const TextStyle(
        //               fontWeight: FontWeight.bold,
        //               fontSize: 30,
        //               color: Color.fromRGBO(18, 19, 25, 1)),
        //         ),
        //       ),
        //     ),
        //     Container(
        //       margin: const EdgeInsets.symmetric(horizontal: 5),
        //       height: 1,
        //       width: double.infinity,
        //       color: Color.fromRGBO(226, 224, 224, 1),
        //     ),
        //     Padding(
        //       padding:
        //           const EdgeInsets.symmetric(vertical: 8.0, horizontal: 3.0),
        //       child: Container(
        //         height: 200,
        //         width: double.infinity,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(12),
        //             border: Border.all(
        //                 width: 1.0, color: Color.fromRGBO(226, 224, 224, 1)),
        //             color: Color.fromRGBO(255, 255, 255, 1)),
        //         child: Center(
        //           child: Text(
        //             'REPORT',
        //             style: const TextStyle(
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 30,
        //                 color: Color.fromRGBO(18, 19, 25, 1)),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: Padding(
        //         padding:
        //             const EdgeInsets.symmetric(vertical: 8.0, horizontal: 3.0),
        //         child: Container(
        //           width: double.infinity,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(12),
        //               border: Border.all(
        //                   width: 1.0, color: Color.fromRGBO(226, 224, 224, 1)),
        //               color: Color.fromRGBO(255, 255, 255, 1)),
        //           child: Center(
        //             child: Text(
        //               'REPORT',
        //               style: const TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 30,
        //                   color: Color.fromRGBO(18, 19, 25, 1)),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // )),
      ],
    );
  }
}
