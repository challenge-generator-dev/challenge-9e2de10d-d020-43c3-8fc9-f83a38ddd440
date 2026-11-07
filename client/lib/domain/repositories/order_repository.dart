// Contrato abstracto para el repositorio de pedidos. Define las operaciones que la capa de dominio
// necesita para interactuar con los datos de pedidos.

package 'package:pedidos_app/domain/repositories/order_repository.dart';

import 'package:pedidos_app/main.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrders();

  Future<Order> createOrder(Order order);

  // Validación de invariantes para los pedidos
  void validateOrder(Order order) {
    if (order.items.isEmpty) {
      throw ArgumentError('El pedido debe contener al menos un item');
    }
    if (order.items.any((item) => item.quantity <= 0)) {
      throw ArgumentError('La cantidad de cada item debe ser mayor a cero');
    }
    if (order.total <= 0) {
      throw ArgumentError('El total del pedido debe ser mayor a cero');
    }
  }
}