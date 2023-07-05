import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class paymentMethodProperties {
  late String imageUrl;
  late Color color;
  late String subtitle;

  paymentMethodProperties(
    this.imageUrl,
    this.color,
    this.subtitle,
  );
}
