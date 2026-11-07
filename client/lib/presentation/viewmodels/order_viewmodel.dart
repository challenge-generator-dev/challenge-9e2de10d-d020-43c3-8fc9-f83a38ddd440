package pedidos_app.presentation.viewmodels;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedidos_app/domain/models/order.dart';
import 'package:pedidos_app/domain/repositories/order_repository.dart';
import 'package:pedidos_app/domain/usecases/get_orders.dart';

enum OrderViewModelStatus {
  initial,
  loading,
  loaded,
  error,
  creating,
  created,
}

class OrderViewModelState {
  final OrderViewModelStatus status;
  final List<Order> orders;
  final String? errorMessage;
  final Order? lastCreatedOrder;
  
  const OrderViewModelState({
    this.status = OrderViewModelStatus.initial,
    this.orders = const [],
    this.errorMessage,
    this.lastCreatedOrder,
  });
  
  OrderViewModelState copyWith({
    OrderViewModelStatus? status,
    List<Order>? orders,
    String? errorMessage,
    Order? lastCreatedOrder,
  }) {
    return OrderViewModelState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      errorMessage: errorMessage,
      lastCreatedOrder: lastCreatedOrder ?? this.lastCreatedOrder,
    );
  }
}

class OrderViewModel extends StateNotifier<OrderViewModelState> {
  final OrderRepository _orderRepository;
  final GetOrders _getOrdersUseCase;
  
  OrderViewModel(this._orderRepository, this._getOrdersUseCase)
      : super(const OrderViewModelState());
  
  Future<void> loadOrders() async {
    state = state.copyWith(status: OrderViewModelStatus.loading);
    
    try {
      final orders = await _getOrdersUseCase();
      state = state.copyWith(
        status: OrderViewModelStatus.loaded,
        orders: orders,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: OrderViewModelStatus.error,
        errorMessage: 'Error al cargar los pedidos: ${e.toString()}',
      );
    }
  }
  
  Future<void> createOrder(Order order) async {
    state = state.copyWith(status: OrderViewModelStatus.creating);
    
    try {
      final createdOrder = await _orderRepository.createOrder(order);
      final updatedOrders = [...state.orders, createdOrder];
      
      state = state.copyWith(
        status: OrderViewModelStatus.created,
        orders: updatedOrders,
        lastCreatedOrder: createdOrder,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: OrderViewModelStatus.error,
        errorMessage: 'Error al crear el pedido: ${e.toString()}',
      );
    }
  }
  
  void resetStatus() {
    if (state.status == OrderViewModelStatus.created ||
        state.status == OrderViewModelStatus.error) {
      state = state.copyWith(status: OrderViewModelStatus.loaded);
    }
  }
  
  void refreshOrders() {
    loadOrders();
  }
}

final orderViewModelProvider =
    StateNotifierProvider<OrderViewModel, OrderViewModelState>((ref) {
  final orderRepository = ref.watch(orderRepositoryProvider);
  final getOrdersUseCase = ref.watch(getOrdersProvider);
  return OrderViewModel(orderRepository, getOrdersUseCase);
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  throw UnimplementedError('El OrderRepository debe ser proporcionado en el main');
});

final getOrdersProvider = Provider<GetOrders>((ref) {
  final orderRepository = ref.watch(orderRepositoryProvider);
  return GetOrders(orderRepository);
});