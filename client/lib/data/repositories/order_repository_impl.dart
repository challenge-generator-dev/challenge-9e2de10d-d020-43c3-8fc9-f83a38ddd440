package pedidos_app.data.repositories;

import 'package:pedidos_app/core/network/api_client.dart';
import 'package:pedidos_app/domain/models/order.dart';
import 'package:pedidos_app/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final ApiClient _apiClient;
  
  OrderRepositoryImpl(this._apiClient);
  
  @override
  Future<List<Order>> getOrders() async {
    return await _apiClient.getOrders();
  }
  
  @override
  Future<Order> createOrder(Order order) async {
    validateOrder(order);
    return await _apiClient.createOrder(order);
  }
  
  @override
  void validateOrder(Order order) {
    if (order.items == null || order.items!.isEmpty) {
      throw ArgumentError('El pedido debe tener al menos un elemento');
    }
    
    for (final item in order.items!) {
      if (item.productName == null || item.productName!.isEmpty) {
        throw ArgumentError('Cada elemento debe tener un nombre de producto');
      }
      if (item.price == null || item.price! <= 0) {
        throw ArgumentError('Cada elemento debe tener un precio válido');
      }
      if (item.quantity == null || item.quantity! <= 0) {
        throw ArgumentError('Cada elemento debe tener una cantidad válida');
      }
    }
    
    if (order.customerName == null || order.customerName!.isEmpty) {
      throw ArgumentError('El pedido debe tener un nombre de cliente');
    }
    
    if (order.customerEmail == null || order.customerEmail!.isEmpty) {
      throw ArgumentError('El pedido debe tener un email de cliente');
    }
  }
}