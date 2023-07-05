import 'package:flutter/material.dart';

class tableFrameInfo extends StatelessWidget {
  final String name;
  final bool status;
  const tableFrameInfo({super.key, required this.name, required this.status});
  @override
  Widget build(BuildContext context) {
    final TableRow rowSpacer = TableRow(children: [
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 15,
      )
    ]);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Table(
        columnWidths: {
          0: FractionColumnWidth(0.5),
          1: FractionColumnWidth(0.70)
        },
        children: [
          TableRow(
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color.fromRGBO(18, 19, 25, 1)),
              ),
              Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: (status == true) ? Colors.green : Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         name,
    //         style: const TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontStyle: FontStyle.normal,
    //             fontSize: 14,
    //             color: Colors.white),
    //       ),
    //       const SizedBox(width: 150),
    //       Expanded(
    //         child: Container(
    //             height: 20,
    //             width: 20,
    //             decoration: BoxDecoration(
    //               color: (status == true) ? Colors.green : Colors.red,
    //               shape: BoxShape.circle,
    //             ),
    //             child: const Center(
    //               child: Icon(
    //                 Icons.check,
    //                 size: 12,
    //                 color: Colors.white,
    //               ),
    //             )),
    //       )
    //     ],
    //   ),
    // );
  }
}
