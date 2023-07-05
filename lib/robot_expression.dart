import 'dart:math';

import 'package:flutter/material.dart';

import 'main.dart';

// void main() => runApp(const RobotExpression());

class RobotExpression extends StatefulWidget {
  const RobotExpression({super.key});

  @override
  State<RobotExpression> createState() => _RobotExpressionState();
}

class statusAni {
  late double width;
  late double height;
  statusAni({required this.width, required this.height});
}

class _RobotExpressionState extends State<RobotExpression> {
  double _width = 200.0;
  double _height = 300.0;
  Color _color = Colors.white;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(100.0);
  bool IsBlinkEyes = false;

  statusAni AnimationBlinkEyes(bool isBlinkEyes) {
    statusAni Close = statusAni(width: 200.0, height: 10.0);
    statusAni Open = statusAni(width: 200.0, height: 300.0);
    if (isBlinkEyes) {
      return Open;
    }
    return Close;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 400.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: AnimatedContainer(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              ),
            ),
            Expanded(flex: 1, child: Container()),
            Center(
              child: AnimatedContainer(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () async {
              await Future.delayed(Duration(milliseconds: 500));
              setState(() {
                IsBlinkEyes = !IsBlinkEyes;
                _width = AnimationBlinkEyes(IsBlinkEyes).width;
                _height = AnimationBlinkEyes(IsBlinkEyes).height;
                _color = Colors.white;
                _borderRadius = BorderRadius.circular(100.0);
              });
              await Future.delayed(Duration(milliseconds: 500));
            },
            child: const Icon(Icons.play_arrow),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new MyApp()),
              );
            },
            child: const Icon(Icons.replay_rounded),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
