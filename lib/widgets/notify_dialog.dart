import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../constants/constant_app.dart';
import '../controllers/productController.dart';
import '../models/model_numpad.dart';

class notifyDialog extends StatelessWidget {
  final String message;
  final String image;
  final String leftButton;
  final String rightButton;
  notifyDialog(
      {required this.message,
      required this.image,
      required this.leftButton,
      required this.rightButton});

  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    final ProductsController _productsController =
        Get.put(ProductsController());
    final NumPadModel _numpad = Get.put(NumPadModel());

    return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        child: SizedBox(
          height: 500,
          width: 500,
          child: Column(children: [
            Expanded(
                flex: 3,
                child: CarouselSlider(
                  items: [
                    SizedBox(
                      width: 500,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              image,
                              height: 200.0,
                              width: 200.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50),
                              child: Center(
                                child: Text(
                                  message,
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/gif/success.gif',
                              height: 300.0,
                              width: 300.0,
                            ),
                            const Center(
                              child: Text(
                                'Successfully',
                                style: TextStyle(fontSize: 50),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                  carouselController: buttonCarouselController,
                  //Slider Container properties
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 2,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () async {
                      await Future.delayed(Duration(milliseconds: 500));
                      buttonCarouselController.animateToPage(1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                      await Future.delayed(Duration(milliseconds: 3000));
                      _productsController.addOrderToTable(
                        _numpad.count_t.toString(),
                        _numpad.count_s.toString(),
                      );
                      // _productsController.mapBilltoProcess();
                      // _productsController.changeTableStatus("Home", false, true);
                      // _productsController.readTable();
                      _productsController.processList.addAll(_productsController
                          .dataProcessStored(_numpad.count_t.toString()));

                      Navigator.pop(context, 'Close');
                    },
                    hoverColor: Color.fromRGBO(245, 245, 245, 1),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromRGBO(200, 200, 200, 1), width: 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0))),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    elevation: 0,
                    child: Center(
                        child: Text('${leftButton}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 18, 19, 25)))),
                  ),
                ),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    hoverColor: Color.fromRGBO(245, 245, 245, 1),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromRGBO(200, 200, 200, 1), width: 1),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.0))),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    elevation: 0,
                    child: Center(
                        child: Text('${rightButton}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 18, 19, 25)))),
                  ),
                )
              ],
            )
          ]),
        ));
  }
}
