import 'package:floor/floor.dart';

import 'package:json_annotation/json_annotation.dart';


part 'order.g.dart';

@JsonSerializable()
@entity
class OrderItem {
  @primaryKey
  final int id, lastId;

  final String image, name;

  final int quantity;

  final double price;

  OrderItem(
    this.id,
    this.lastId,
    this.image,
    this.name,
    this.quantity,
    this.price
  );

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  // OrderItem OrderItemFromJson(Map<String, dynamic> productItem) => OrderItem(
  //     productItem['id'] as int,
  //     productItem['lastId'] as int,
  //     productItem['image'] as String,
  //     productItem['name'] as String,
  //     productItem['quantity'] as int,
  //     productItem['price'] as double,
  //   );

}