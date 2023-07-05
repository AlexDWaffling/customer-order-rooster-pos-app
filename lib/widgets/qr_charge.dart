import 'package:flutter/material.dart';

class qrCharge extends StatelessWidget {
  final String method;
  const qrCharge({Key? key, required this.method}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 600,
        height: 600,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          // shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border:
              Border.all(width: 1.0, color: Color.fromRGBO(200, 200, 200, 1)),
        ),
        child: Center(
          child: Image.asset(
            method,
            width: 600,
            height: 600,
            scale: 0.5,
          ),
        ),
      ),
    );
  }
}
