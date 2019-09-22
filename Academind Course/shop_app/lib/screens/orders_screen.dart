import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';
import '../provider/orders.dart' show Orders;
import '../widgets/main_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        drawer: MainDrawer(),
        appBar:
            AppBar(title: Text('Your Orders'), elevation: 0, centerTitle: true),
        body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
        ));
  }
}
