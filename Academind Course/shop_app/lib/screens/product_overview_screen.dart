import 'package:flutter/material.dart';

import '../widgets/product_grid.dart';
import '../widgets/badge.dart';

enum FilterOptions { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _onlyShowFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('My Shop'),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _onlyShowFavorites = true;
                } else {
                  _onlyShowFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                value: FilterOptions.Favorites,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.favorite_border),
                    Text('Favorites'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: FilterOptions.All,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.list),
                    Text('Show All'),
                  ],
                ),
              )
            ],
          ),
          // Badge(
          //   child: Consumer<Cart>(
          //     child: IconButton(
          //       icon: Icon(Icons.shopping_cart),
          //       onPressed: () {},
          //     ),
          //   ),
          //   value: 1,
          // )
        ],
      ),
      body: ProductGrid(_onlyShowFavorites),
    );
  }
}
