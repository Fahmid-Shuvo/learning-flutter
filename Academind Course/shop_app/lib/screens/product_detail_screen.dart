import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<ProductsProvider>(context).findById(productId);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(loadedProduct.title),
          elevation: 0,
          centerTitle: true),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Hero(
            tag: loadedProduct.imageUrl,
            child: Image.network(loadedProduct.imageUrl)),
      ),
    );
  }
}
