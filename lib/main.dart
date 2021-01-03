import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screen/screen.dart';
import 'constants/routes_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ByItApp());
}

class ByItApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuyItApp',
      initialRoute: RoutesConstants.login,
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
      theme: ThemeData.dark(),
    );
  }
}
