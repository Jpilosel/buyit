import 'package:buyit/Screen/Signup_screen.dart';
import 'package:buyit/Screen/account_screen.dart';
import 'package:buyit/Screen/cart_screen.dart';
import 'package:buyit/Screen/checkout_screen.dart';
import 'package:buyit/Screen/search_screen.dart';
import 'package:buyit/Screen/shop_screen.dart';
import 'package:buyit/constants/routes_constants.dart';
import 'package:buyit/screen/product_screen.dart';
import 'package:flutter/material.dart';

import 'screen/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuyIt',
      routes: {
        RoutesConstant.account: (context) => AccountScreen(),
        RoutesConstant.cart: (context) => CartScreen(),
        RoutesConstant.checkout: (context) => CheckoutScreen(),
        RoutesConstant.login: (context) => LoginScreen(),
        RoutesConstant.product: (context) => ProductScreen(),
        RoutesConstant.search: (context) => SearchScreen(),
        RoutesConstant.shop: (context) => ShopScreen(),
        RoutesConstant.singup: (context) => SignupScreen(),
      },
      home: LoginScreen(),
    );
  }
}
