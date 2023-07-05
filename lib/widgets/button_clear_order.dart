import 'package:flutter/material.dart';

class btnClearOrder extends StatefulWidget {
  const btnClearOrder({super.key});

  @override
  State<btnClearOrder> createState() => _btnClearOrderState();
}

class _btnClearOrderState extends State<btnClearOrder> {
  Color _colorTextNon = Colors.white;
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      _colorTextNon = Colors.white;
      _exitCounter++;
    });
  }

  void _updateTextColor(PointerEvent details) {
    _colorTextNon = Color.fromRGBO(18, 19, 25, 1);
    x = details.position.dx;
    y = details.position.dy;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 80,
      child: MouseRegion(
        onHover: _updateTextColor,
        onEnter: _incrementEnter,
        onExit: _incrementExit,
        child: FloatingActionButton(
          onPressed: () {},
          hoverColor: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1),
              borderRadius: BorderRadius.circular(18)),
          backgroundColor: Color.fromRGBO(18, 19, 25, 1),
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delete,
                size: 16,
                color: _colorTextNon,
              ),
              SizedBox(width: 6),
              Text(
                'Clear',
                style: TextStyle(
                  color: _colorTextNon,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
