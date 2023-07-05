import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class tableOrderList extends StatelessWidget {
  final String id;
  final String list_name;
  final String progress;
  final double fontSize;
  final FontWeight fontWeight;
  tableOrderList({
    required this.id,
    required this.list_name,
    required this.progress,
    required this.fontSize,
    required this.fontWeight,
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
                    child: Text(
                      progress,
                      style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                          color: Color.fromRGBO(18, 19, 25, 1)),
                    ),
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
