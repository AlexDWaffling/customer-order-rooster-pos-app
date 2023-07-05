import 'package:flutter/material.dart';

class logoBar extends StatelessWidget{
   @override
    Widget build(BuildContext context){        
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(18, 19, 25, 1),
            ),
            child: const Icon(
              Icons.fastfood,
              color: Colors.white,
              size: 14,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'POSBOT',
            style: TextStyle(
              color: Color.fromRGBO(18, 19, 25, 1),
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
  }