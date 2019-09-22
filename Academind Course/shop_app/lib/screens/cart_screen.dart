import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';
import '../provider/orders.dart' show Orders;
import '../provider/cart.dart' show Cart;
import '../widgets/main_drawer.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<Cart>(context);
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text('Your Cart'), elevation: 0, centerTitle: true),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      'Rs.${cartItem.totalAmount.toStringAsFixed(0)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  FlatButton(
                    child: Text('ORDER NOW'),
                    textColor: Colors.purple,
                    onPressed: () {
                      Provider.of<Orders>(context).addOrder(
                        cartItem.items.values.toList(),
                        cartItem.totalAmount,
                      );
                      cartItem.clear();
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItem.items.length,
              itemBuilder: (ctx, i) => CartItem(
                title: cartItem.items.values.toList()[i].title,
                price: cartItem.items.values.toList()[i].price,
                productId: cartItem.items.keys.toList()[i],
                quantity: cartItem.items.values.toList()[i].quantity,
                id: cartItem.items.values.toList()[i].id,
              ),
            ),
          )
        ],
      ),
    );
  }
}
