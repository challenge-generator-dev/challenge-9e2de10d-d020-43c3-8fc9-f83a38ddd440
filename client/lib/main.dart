import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedidos_app/presentation/screens/order_screen.dart';

void main() {
  runApp(const ProviderScope(child: PedidosApp()));
}

class PedidosApp extends StatelessWidget {
  const PedidosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedidos App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OrderScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Configuración de variables de entorno para la API
class ApiConfig {
  static const String baseUrl = 'https://api.pedidos.app';
}

// Modelo de Order (inmutable con freezed)
@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String customerId,
    required List<OrderItem> items,
    required String status,
    required DateTime createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String productId,
    required int quantity,
    required double price,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
}

// Repositorio abstracto (contrato)
abstract class OrderRepository {
  Future<List<Order>> getOrders();
  Future<Order> createOrder(Order order);
}

// Provider para inyección de dependencias
final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  throw UnimplementedError('Implementación debe ser proporcionada por la capa data');
});