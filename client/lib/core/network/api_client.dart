// Cliente HTTP para consumir la API de pedidos. Maneja conexiones, errores y parsing de respuestas.

package 'package:pedidos_app/core/network/api_client.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pedidos_app/main.dart';

class ApiClient {
  final http.Client _client;
  final String baseUrl;

  ApiClient({http.Client? client, String? baseUrl})
      : _client = client ?? http.Client(),
        baseUrl = baseUrl ?? ApiConfig.baseUrl;

  Future<List<Order>> getOrders() async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/orders'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Order.fromJson(json)).toList();
      } else {
        throw Exception('Error al obtener pedidos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de red al obtener pedidos: $e');
    }
  }

  Future<Order> createOrder(Order order) async {
    try {
      final response = await _client.post(
        Uri.parse('$baseUrl/orders'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(order.toJson()),
      );

      if (response.statusCode == 201) {
        return Order.fromJson(json.decode(response.body));
      } else {
        throw Exception('Error al crear pedido: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de red al crear pedido: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}