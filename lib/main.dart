import 'package:flutter/material.dart';

import 'screen/screen.dart';
import 'constants/routes_constants.dart';

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
