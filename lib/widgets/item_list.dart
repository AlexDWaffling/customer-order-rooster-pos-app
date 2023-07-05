import 'package:flutter/material.dart';

class itemList extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final int quantity;
  final tap;
  const itemList(
      {required this.image,
      required this.title,
      required this.price,
      required this.quantity,
      this.tap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: FloatingActionButton(
        onPressed: tap,
        hoverColor: Color.fromRGBO(245, 245, 245, 1),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color.fromRGBO(240, 240, 240, 1), width: 1),
            borderRadius: BorderRadius.circular(18)),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    // border: Border.all(width: 1.0, color: Color.fromRGBO(226, 224, 224, 1)),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 18, 19, 25),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price.toString(),
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 18, 19, 25),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
