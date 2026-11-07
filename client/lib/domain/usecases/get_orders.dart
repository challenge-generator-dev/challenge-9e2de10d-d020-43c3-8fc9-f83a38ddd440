// Caso de uso para obtener la lista de pedidos. Coordina la interacción entre la capa de presentación
// y el repositorio de pedidos, aplicando reglas de negocio.

package 'package:pedidos_app/domain/usecases/get_orders.dart';

import 'package:pedidos_app/domain/repositories/order_repository.dart';
import 'package:pedidos_app/main.dart';

class GetOrders {
  final OrderRepository orderRepository;

  GetOrders(this.orderRepository);

  Future<List<Order>> call() async {
    try {
      final orders = await orderRepository.getOrders();
      // Aplicar reglas de negocio adicionales si es necesario
      return orders.where((order) => order.status != 'cancelled').toList();
    } catch (e) {
      // Manejo de errores específico para el caso de uso
      throw Exception('No se pudieron obtener los pedidos: $e');
    }
  }
}