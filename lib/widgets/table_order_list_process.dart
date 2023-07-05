import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'table_frame_info.dart';

class tableOrderListProcess extends StatelessWidget {
  final String id;
  final String table_name;
  final String list_name;
  final String progress;
  final bool isTitle;
  final double fontSize;
  final enter;
  final bool status;
  final FontWeight fontWeight;
  tableOrderListProcess({
    required this.id,
    required this.table_name,
    required this.list_name,
    required this.progress,
    required this.fontSize,
    required this.fontWeight,
    required this.isTitle,
    required this.enter,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  child: Center(
                    child: Text(
                      id,
                      style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                          color: Color.fromRGBO(18, 19, 25, 1)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 1,
                  color: const Color.fromRGBO(200, 200, 200, 1),
                ),
                SizedBox(
                  width: 150,
                  child: Center(
                    child: Text(
                      table_name,
                      style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                          color: Color.fromRGBO(18, 19, 25, 1)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 1,
                  color: const Color.fromRGBO(200, 200, 200, 1),
                ),
                SizedBox(
                  width: 150,
                  child: Center(
                    child: Text(
                      list_name,
                      style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                          color: Color.fromRGBO(18, 19, 25, 1)),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 1,
                  color: const Color.fromRGBO(200, 200, 200, 1),
                ),
                Expanded(flex: 1, child: Container()),
                SizedBox(
                  width: 150,
                  child: Center(
                    child: Builder(builder: (BuildContext context) {
                      if (isTitle) {
                        return Text(
                          progress,
                          style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: fontWeight,
                              color: Color.fromRGBO(18, 19, 25, 1)),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: (status == true)
                                    ? Colors.green
                                    : Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )),
                        );
                      }
                    }),
                    // child: Text(
                    //   progress,
                    //   style: TextStyle(
                    //       fontSize: fontSize,
                    //       fontWeight: fontWeight,
                    //       color: Color.fromRGBO(18, 19, 25, 1)),
                    // ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 1,
                  color: const Color.fromRGBO(200, 200, 200, 1),
                ),
                SizedBox(
                  width: 150,
                  child: Center(child: Builder(builder: (BuildContext context) {
                    if (isTitle) {
                      return Text(
                        'Start Process',
                        style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: fontWeight,
                            color: Color.fromRGBO(18, 19, 25, 1)),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          onPressed: enter,
                          hoverColor: Color.fromRGBO(226, 224, 224, 1),
                          shape: BeveledRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromRGBO(150, 150, 150, 1),
                                  width: 0.1),
                              borderRadius: BorderRadius.circular(3.0)),
                          backgroundColor: Colors.amber,
                          elevation: 0,
                          child: Text(
                            'Start',
                            style: const TextStyle(
                              color: Color.fromRGBO(18, 19, 25, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          // borderSide: BorderSide(color: color),
                        ),
                      );
                    }
                  })
                      // Text(
                      //   'Start Process',
                      //   style: TextStyle(
                      //       fontSize: fontSize,
                      //       fontWeight: fontWeight,
                      //       color: Color.fromRGBO(18, 19, 25, 1)),
                      // ),
                      ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: const Color.fromRGBO(200, 200, 200, 1),
          ),
        ],
      ),
    );
  }
}
