import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final String productId;
  final int quantity;
  final double price;
  CartItem(this.id, this.title, this.quantity, this.price, this.productId);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.0),
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
       return showDialog(

            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("Are you sure"),
                  content:
                  Text("هل تريد الحذف من المتطلبات"),
              actions: <Widget>[
                FlatButton(onPressed: (){
                  Navigator.of(ctx).pop(false);
                }, child: Text("لا"),),

              FlatButton(onPressed: (){
                Navigator.of(ctx).pop(true);
              }, child: Text("نعم"),
              textColor: Colors.green,),


              ],
                )
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text("\$$price",),

                ),
              ),
            ),
            title: Text(title),
            subtitle: Text("الكميه: \$${(price * quantity)}"),
            trailing: Text(" $quantity X"),
          ),
        ),
      ),
    );
  }
}
