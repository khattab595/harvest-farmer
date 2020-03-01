import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../providers/orders.dart';
import '../widgets/app_drawer.dart';
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("مشترياتي"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "المجموع",
                    style: TextStyle(fontSize: 20.0,color: Colors.green),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmpunt.toStringAsFixed(2)}',
                      style: TextStyle(
                          color:Colors.white),
                    ),
                    backgroundColor:Colors.green,
                  ),
                    OrderButton(cart: cart),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, i) => ci.CartItem(
                        cart.items.values.toList()[i].id,
                        cart.items.values.toList()[i].title,
                        cart.items.values.toList()[i].quantity,
                        cart.items.values.toList()[i].price,
                        cart.items.keys.toList()[i],
                      )))
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(

      child: _isLoading? CircularProgressIndicator():Text("اطلب الان"),
      onPressed: (widget.cart.totalAmpunt <= 0 || _isLoading) ? null : () async{
              setState(() {
                _isLoading = true;
              });
             await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(), widget.cart.totalAmpunt);
              setState(() {
                _isLoading = false;
              });
              widget.cart.Clear();
            },
      textColor: Theme.of(context).primaryColor,
    );
  }
}
