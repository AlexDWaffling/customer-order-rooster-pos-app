import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class tablePageDetail extends StatelessWidget {
  final int name;
  final doubleTap;
  final tap;
  tablePageDetail({required this.name, this.tap, this.doubleTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: doubleTap,
      child: FloatingActionButton(
        onPressed: tap,
        hoverColor: Color.fromRGBO(245, 245, 245, 1),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color.fromRGBO(200, 200, 200, 1), width: 1),
            borderRadius: BorderRadius.circular(18)),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        child: Center(
            child: Text('T${name}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Color.fromARGB(255, 18, 19, 25)))),
      ),
    );
  }
}
