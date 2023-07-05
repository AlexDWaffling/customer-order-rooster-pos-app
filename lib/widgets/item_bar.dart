import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

class itemBar extends StatelessWidget {
  final String menu;
  final IconData icon;
  final tap_state;
  const itemBar({
    required this.menu,
    required this.icon,
    this.tap_state,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: FloatingActionButton(
        onPressed: tap_state,
        hoverColor: Color.fromRGBO(226, 224, 224, 1),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
        backgroundColor: Color.fromARGB(240, 240, 240, 240),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              DecoratedIcon(
                icon: Icon(
                  icon,
                  color: Color.fromARGB(240, 240, 240, 240),
                ),
                decoration: IconDecoration(
                    border: IconBorder(
                        width: 2.0, color: Color.fromRGBO(45, 43, 43, 1))),
              ),
              const SizedBox(height: 5),
              Text(
                menu,
                style: const TextStyle(
                    color: Color.fromRGBO(45, 43, 43, 1), fontSize: 9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
