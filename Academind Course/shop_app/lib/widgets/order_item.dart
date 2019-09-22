import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../provider/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem orderItem;

  OrderItem(this.orderItem);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Rs.${widget.orderItem.totalAmount}'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm')
                .format(widget.orderItem.createdAt)),
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded)
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                height: min(widget.orderItem.products.length * 20.0 + 10, 100),
                child: ListView(
                    children: widget.orderItem.products
                        .map((product) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  '${product.title}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  'x${product.quantity}   Rs.${product.price}',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ))
                        .toList()))
        ],
      ),
    );
  }
}
