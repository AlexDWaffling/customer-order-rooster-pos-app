import 'package:flutter/material.dart';

class hisTable extends StatelessWidget {
  final int id;
  final String total;
  final tap;
  const hisTable({required this.id, required this.total, this.tap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1.0, color: Color.fromRGBO(226, 224, 224, 1)),
              color: Color.fromRGBO(255, 255, 255, 1)
              // color: const Color(0xff1f2029),
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: double.infinity,
                width: 50,
                // color: Colors.green,
                child: Center(
                    child: Text(
                  '#${id.toString()}',
                  style: const TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(18, 19, 25, 1),
                  ),
                )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                height: double.infinity,
                width: 1,
                color: Colors.black,
              ),
              Expanded(
                  child: Container(
                height: double.infinity,
                width: 300,
                child: Center(
                    child: Text(
                  total,
                  style: const TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(18, 19, 25, 1),
                  ),
                )),
                // color: Colors.cyan,
              )),
            ],
          )),
    );
  }
}
