import 'package:flutter/material.dart';

import 'screen/register_screen.dart';
import 'screen/login_screen.dart';
import 'screen/account_screen.dart';
import 'screen/cart_screen.dart';
import 'screen/checkout_screen.dart';
import 'screen/search_screen.dart';
import 'screen/shop_screen.dart';
import 'constants/routes_constants.dart';
import 'screen/product_screen.dart';

void main() => runApp(ByItApp());

class ByItApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuyItApp',
      routes: {
        RoutesConstants.account: (context) => AccountScreen(),
        RoutesConstants.cart: (context) => CartScreen(),
        RoutesConstants.checkout: (context) => CheckoutScreen(),
        RoutesConstants.login: (context) => LoginScreen(),
        RoutesConstants.product: (context) => ProductScreen(),
        RoutesConstants.search: (context) => SearchScreen(),
        RoutesConstants.shop: (context) => ShopScreen(),
        RoutesConstants.register: (context) => RegisterScreen(),
      },
      home: LoginScreen(),
    );
  }
}
