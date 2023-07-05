import 'package:floor/floor.dart';

import '../entity/item.dart';
import '../entity/order.dart';

@dao
abstract class ItemDAO{
  @Query('SELECT * FROM ProductItem')
  Future<List<ProductItem>> getAllItems();

  @Query('SELECT * FROM ProductItem WHERE category =:category')
  Future<List<ProductItem>> getAllItemsByCategory(String category);

  @insert
  Future<void> insertItem(ProductItem productItem);

  @update
  Future<void> updateItem(ProductItem productItem);

  @delete
  Future<void> deleteItem(ProductItem productItem);

  @Query('DELETE FROM ProductItem')
  Future<void> deleteAllItem();

  // @Query('SELECT * FROM OrderItem')
  // Future<List<OrderItem>> getAllOrderItems();

  // @insert
  // Future<void> insertOrderItem(OrderItem orderItem);

  // @update
  // Future<void> updateOrderItem(OrderItem orderItem);

  // @delete
  // Future<void> deleteOrderItem(OrderItem orderItem);

  // @Query('DELETE FROM OrderItem')
  // Future<void> deleteAllOrderItem();

}
//  @dao
//  abstract class OrderDAO{
//   @Query('SELECT * FROM OrderItem')
//   Future<List<OrderItem>> getAllOrderItems();

//   @insert
//   Future<void> insertOrderItem(OrderItem orderItem);

//   @update
//   Future<void> updateOrderItem(OrderItem orderItem);

//   @delete
//   Future<void> deleteOrderItem(OrderItem orderItem);

//   @Query('DELETE FROM OrderItem')
//   Future<void> deleteAllOrderItem();
//  }