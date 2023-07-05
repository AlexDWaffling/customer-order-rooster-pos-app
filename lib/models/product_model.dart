import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const CATEGORY = "category";
  static const PRICE = "price";

  late String id;
  late String image;
  late String name;
  late String category;
  late double price;

  int count = 1;

  ProductModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.category,
      required this.price});

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    category = data[CATEGORY];
    price = data[PRICE].toDouble();
  }
  factory ProductModel.fromJson(Map<dynamic, dynamic> json) => ProductModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      category: json['category'],
      price: json['price']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "category": category,
        "price": price,
      };

  ProductModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        name = doc.data()!["name"],
        image = doc.data()!["image"],
        category = doc.data()!["category"],
        price = doc.data()!["price"];
}
