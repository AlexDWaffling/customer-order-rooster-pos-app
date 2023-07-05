import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

class itemTab extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;
  final tap;
  const itemTab(
      {required this.icon,
      required this.title,
      required this.isActive,
      this.tap});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: tap,
      hoverColor: Color.fromRGBO(245, 245, 245, 1),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(240, 240, 240, 1), width: 1),
          borderRadius: BorderRadius.circular(18)),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DecoratedIcon(
            icon: Icon(
              icon,
              color: Color.fromARGB(240, 240, 240, 240),
            ),
            decoration: IconDecoration(
                border: IconBorder(width: 2.0, color: Color(0xFF2D2B2B))),
          ),
          const SizedBox(width: 8.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              color: Color.fromRGBO(18, 19, 25, 1),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
