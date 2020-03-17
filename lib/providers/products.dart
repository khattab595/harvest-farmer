import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/http_exception.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [

  ];
  // var _showFavoritesOnly= false;
     final String authToken;
  final String userId;
  Products(this.authToken,this.userId,this._items);
  List<Product> get items {

    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }



  Future<void> fetchAndSetProducts([bool filterByUser=false]) async {
    final filterString=filterByUser?'orderBy="creatorId"equalTo="$userId"':'';
   var url = 'https://harvist-app.firebaseio.com//products.json?auth=$authToken&$filterString';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if(extractedData==null){
        return;
      }
       url = 'https://harvist-app.firebaseio.com/userFavorites/$userId.json?auth=$authToken';

      final favoritrResponse= await http.get(url);
      final favaiteData =json.decode(favoritrResponse.body);
      final List<Product> lodedProducts = [];
      extractedData.forEach((prodId, prodData) {
        lodedProducts.add(Product(
            id: prodId,
            title: prodData['title'],
            price: prodData['price'],
            description: prodData['description'],
            imageUrl: prodData['imageUrl'],
            isFavorite:favaiteData==null?false:  favaiteData[prodId] ??false,

        ));
      });
      _items = lodedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProuduct(Product product) async {
    final url = 'https://harvist-app.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'creatorId':userId,

          }));
      final newProduct = Product(
        title: product.title,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
        id: json.decode(response.body)['name'],
      );

      _items.add(newProduct);
//   items.insert(0, newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = 'https://harvist-app.firebaseio.com/products/$id.json?auth=$authToken';
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print("...");
    }
  }

Future<void> deleteProuduct(String id) async{
    final url = 'https://harvist-app.firebaseio.com/products/$id.json?auth=$authToken';
    final existingProductIndex=_items.indexWhere((prod)=>prod.id==id);
    var existingProduct=_items[existingProductIndex];
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
    _items.removeAt(existingProductIndex);
  final response= await  http.delete(url) ;
      if(response.statusCode>=400){
        throw HttpException('could not delete product.');
      }
      existingProduct=null;

    {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();

  }
}}
