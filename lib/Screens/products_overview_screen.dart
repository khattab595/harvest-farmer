import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Screens/cart_screen.dart';
import '../providers/cart.dart';
import '../providers/products.dart';
import '../widgets/app_drawer.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';


enum FilterOptions {
  Favorites,
  All,
}

class ProdactsOverViewScreen extends StatefulWidget {
  @override
  _ProdactsOverViewScreenState createState() => _ProdactsOverViewScreenState();
}

class _ProdactsOverViewScreenState extends State<ProdactsOverViewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoding=  false;
  @override
  void initState() {

// Future.delayed(Duration.zero).then( (_){
//   Provider.of<Products>(context).fetchAndSetProducts();
// });
    super.initState();
  }
  @override
  void didChangeDependencies() {
     if(_isInit){
       setState(() {
         _isLoding= true;
       });

       Provider.of<Products>(context).fetchAndSetProducts().then((_){
         _isLoding=false;
       });
     }
     _isInit= false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Harvest Farmer"),
          backgroundColor: Colors.green,
          actions: <Widget>[
        PopupMenuButton(
          onSelected: (FilterOptions selectValue) {
            setState(() {
              if (selectValue == FilterOptions.Favorites) {
                _showOnlyFavorites = true;
              } else {
                _showOnlyFavorites = false;
              }
            });
          },
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(
              child: Text("المفضل فقط"),
              value: FilterOptions.Favorites,
            ),
            PopupMenuItem(
              child: Text("كل المنتجات"),
              value: FilterOptions.All,
            )
          ],
        ),
        
      ]
      ),
      drawer: AppDrawer(),
      body:_isLoding?Center(child: CircularProgressIndicator(),) :ProductsGrid(_showOnlyFavorites),
    );
  }
}
