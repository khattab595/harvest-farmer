import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:provider/provider.dart';
import '../Screens/product_details_screen.dart';
import '../providers/auth.dart';
import '../providers/cart.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailsScreen.routName,
                arguments: product.id,
              );
            },
            child: Hero(
              tag: product.id,
              child: FadeInImage(
                placeholder:
                    AssetImage('assets/images/_product-placeholder.jpg'),
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            )),
        footer: GridTileBar(
          backgroundColor: Colors.green,
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toggleFavoriteStatus(
                  authData.token,
                  authData.userId,
                );
              },
              color: Colors.white,
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          // trailing: IconButton(
          //   icon: Icon(Icons.shopping_cart),
          //   onPressed: () {
          //     cart.addItem(product.id, product.price, product.title);
          //     Scaffold.of(context).hideCurrentSnackBar();
          //     Scaffold.of(context).showSnackBar(SnackBar(
          //       content: Text(
          //         'تم اضافة عنصر الي  المشتريات',
          //         textAlign: TextAlign.center,
          //       ),
          //       duration: Duration(seconds: 2),
          //       action: SnackBarAction(
          //         label: 'الغاء الاضافه',
          //         onPressed: () {
          //           cart.removeSingleItem(product.id);
          //         },
          //       ),
          //     ));
          //   },
          //   color: Colors.white
          // ),
        ),
      ),
    );
  }
}
