import 'package:flutter/material.dart';

class searchBar extends StatelessWidget{
  const searchBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: 600,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(width: 1.0, color: Color.fromRGBO(226, 224, 224, 1)),
        ),
        child: Row(
          children: const [
            Icon(
              Icons.search,
              color: Color.fromRGBO(18, 19, 25, 1),
            ),
            SizedBox(width: 10),
            Text(
              'Search menu here...',
              style: TextStyle(color: Color.fromRGBO(18, 19, 25, 1), fontSize: 11),
            )
          ],
        ));
  }
}