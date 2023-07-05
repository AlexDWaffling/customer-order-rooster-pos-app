import 'package:flutter/material.dart';

class topTitleRes extends StatelessWidget {
  final String title;
  final String subTitle;
  topTitleRes({required this.title, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 18, 19, 25),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subTitle,
              style: const TextStyle(
                color: Color.fromARGB(255, 18, 19, 25),
                fontSize: 10,
              ),
            ),
          ],
        ),
        Expanded(flex: 1, child: Container(width: double.infinity)),
      ],
    );
  }
}
