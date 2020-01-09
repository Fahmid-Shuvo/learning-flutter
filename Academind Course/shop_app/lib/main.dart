import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';

//Screens
import './screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_product_screen.dart';
import './screens/add_and_edit_product_screen.dart';
import './screens/auth-screen.dart';

//Providers
import './provider/products_provider.dart';
import './provider/cart.dart';
import './provider/orders.dart';
import './provider/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, ProductsProvider>(
            builder: (ctx, auth, prevProduct) =>
                ProductsProvider(auth.token, prevProduct == null ? [] : prevProduct.items),
          ),
          ChangeNotifierProxyProvider<Auth, Cart>(
            builder: (ctx, auth, prevCart) => Cart(),
          ),
          ChangeNotifierProxyProvider<Auth, Orders>(
            builder: (ctx, auth, prevOrders) =>
                Orders(auth.token, prevOrders == null ? [] : prevOrders.getOrders),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                  primarySwatch: white, accentColor: Colors.deepOrange, fontFamily: 'JosefinSans'),
              home: auth.isAuth ? ProductOverviewScreen() : AuthScreen(),
              routes: {
                ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
                CartScreen.routeName: (ctx) => CartScreen(),
                OrdersScreen.routeName: (ctx) => OrdersScreen(),
                UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
                AddAndEditProductScreen.routeName: (ctx) => AddAndEditProductScreen(),
              }),
        ));
  }
}
