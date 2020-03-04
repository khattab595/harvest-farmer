import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Screens/splash_screen.dart';
import './providers/auth.dart';
import './providers/cart.dart';
import './providers/orders.dart';

import './Screens/user_products_screen.dart';
import './Screens/products_overview_screen.dart';
import './Screens/product_details_screen.dart';
import './providers/products.dart';

import 'package:provider/provider.dart';
import './Screens/edit_product_screen.dart';
import 'Screens/cart_screen.dart';
import './Screens/order_screen.dart';
import './Screens/auth_screen.dart';
import './helpers/custom_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool seen = preferences.getBool('seen');
  Widget _screen;

  if(seen == null || seen == false){
    _screen = SplashScreen();
  }else{
    _screen = AuthScreen();
  }
  runApp(
    MyHome(_screen),
  );
}

class MyHome extends StatelessWidget {
  final Widget _screen;
  MyHome(this._screen);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            builder: (ctx, auth, previousProducts) => Products(
                auth.token,
                auth.userId,
                previousProducts == null ? [] : previousProducts.items),
          ),
          ChangeNotifierProvider.value(value: Cart()),
          ChangeNotifierProxyProvider<Auth, Orders>(
            builder: (ctx, auth, previousOrders) => Orders(
                auth.token,
                auth.userId,
                previousOrders == null ? [] : previousOrders.orders),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MyShop',
            theme: ThemeData(
                primarySwatch: Colors.green,
                accentColor: Colors.tealAccent,
                fontFamily: 'lato',
                pageTransitionsTheme: PageTransitionsTheme(builders: {
                  TargetPlatform.android: CustomPageTransitionBuilder(),
                  TargetPlatform.iOS: CustomPageTransitionBuilder(),
                })),
            home: auth.isAuth
                ? ProdactsOverViewScreen()
                
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? this._screen
                            : AuthScreen(),
                  ),
            routes: {
              ProductDetailsScreen.routName: (ctx) => ProductDetailsScreen(),
              OrdersScreen.routeName: (ctx) => OrdersScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
              EditProductScreen.routeName: (ctx) => EditProductScreen(),
            },
          ),
        ));
  }
}
