import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/http_exception.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [
//    Product(
//      id: 'p1',
//      title: 'Red Shirt',
//      description: 'A red shirt - it is pretty red!',
//      price: 29.99,
//      imageUrl:
//          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//    ),
//    Product(
//      id: 'p2',
//      title: 'Trousers',
//      description: 'A nice pair of trousers.',
//      price: 59.99,
//      imageUrl:
//          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
//    ),
//    Product(
//      id: 'p3',
//      title: 'Yellow Scarf',
//      description: 'Warm and cozy - exactly what you need for the winter.',
//      price: 19.99,
//      imageUrl:
//          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
//    ),
//    Product(
//      id: 'p4',
//      title: 'A Pan',
//      description: 'Prepare any meal you want.',
//      price: 49.99,
//      imageUrl:
//          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
//    ),
  ];
  // var _showFavoritesOnly= false;
     final String authToken;
  final String userId;
  Products(this.authToken,this.userId,this._items);
  List<Product> get items {
    //if(_showFavoritesOnly){
    //return _items.where((prodItem)=> prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }


  // void showFavoritesOnly(){
  // _showFavoritesOnly=true;
  // notifyListeners();
  // }
  //void showAll(){
  // _showFavoritesOnly=false;
  // notifyListeners();
  //}
  Future<void> fetchAndSetProducts([bool filterByUser=false]) async {
    final filterString=filterByUser?'orderBy="creatorId"equalTo="$userId"':'';
   var url = 'https://harvest-f25b0.firebaseio.com/products.json?auth=$authToken&$filterString';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if(extractedData==null){
        return;
      }
       url = 'https://harvest-f25b0.firebaseio.com/userFavorites/$userId.json?auth=$authToken';

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
    final url = 'https://harvest-f25b0.firebaseio.com/products.json?auth=$authToken';
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
      final url = 'https://harvest-f25b0.firebaseio.com/products/$id.json?auth=$authToken';
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
    final url = 'https://harvest-f25b0.firebaseio.com/products/$id.json?auth=$authToken';
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
