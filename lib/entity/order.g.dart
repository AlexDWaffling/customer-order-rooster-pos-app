// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      json['id'] as int,
      json['lastId'] as int,
      json['image'] as String,
      json['name'] as String,
      json['quantity'] as int,
      (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'lastId': instance.lastId,
      'image': instance.image,
      'name': instance.name,
      'quantity': instance.quantity,
      'price': instance.price,
    };
