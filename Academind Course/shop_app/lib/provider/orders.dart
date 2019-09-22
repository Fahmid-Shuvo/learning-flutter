import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './cart.dart' show CartItem;

class OrderItem {
  final String id;
  final List<CartItem> products;
  final double totalAmount;
  final DateTime createdAt;

  OrderItem({
    @required this.id,
    @required this.products,
    @required this.totalAmount,
    @required this.createdAt,
  });
}

class Orders extends ChangeNotifier {
  List<OrderItem> orders = [];

  List<OrderItem> get getOrders {
    return [...orders];
  }

  void addOrder(List<CartItem> cartProducts, double totalAMount) {
    orders.insert(
      0,
      OrderItem(
          id: DateTime.now().toString(),
          createdAt: DateTime.now(),
          products: cartProducts,
          totalAmount: totalAMount),
    );
    notifyListeners();
  }
}
