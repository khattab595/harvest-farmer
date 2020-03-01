import 'dart:io';
import 'package:flutter/material.dart' as prefix0;
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descruptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editProduct =
  Product(id: null, title: '', description: '', imageUrl: '', price: 0);
  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updatImageUrl);
    super.initState();
  }

  var _isInit = true;
  var _isloading = false;
  var _initValues = {
    'id': "",
    'title': "",
    'description': "",
    'imageUrl': "",
    'price': "",
  };
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final prouductId = ModalRoute.of(context).settings.arguments as String;
      if (prouductId != null) {
        _editProduct =
            Provider.of<Products>(context, listen: false).findById(prouductId);
        _initValues = {
          'title': _editProduct.title,
          'description': _editProduct.description,
          //  'imageUrl': _editProduct.imageUrl,
          'imageUrl': "",
          'price': _editProduct.price.toString(),
        };
        _imageUrlController.text = _editProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updatImageUrl);
    _priceFocusNode.dispose();
    _descruptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();

    super.dispose();
  }

  void _updatImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
          !_imageUrlController.text.startsWith('https')) )  {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isloading = true;
    });

    if (_editProduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editProduct.id, _editProduct);
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProuduct(_editProduct);
      } catch (error) {
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(' An Error  occurred !'),
              content: Text('something went wrong .'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text('Ok'))
              ],
            ));
//      } finally {
//        setState(() {
//          _isloading = false;
//        });
//        Navigator.of(context).pop();
      }
      setState(() {
        _isloading = false;
      });
      Navigator.of(context).pop();
    }
    //Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: prefix0.Colors.green,
        title: Text("Edit Product"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: _isloading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  initialValue: _initValues['title'],
                  decoration: InputDecoration(labelText: 'الاسم'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'من فضلك ادخل الاسم.';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _editProduct = Product(
                      title: value,
                      description: _editProduct.description,
                      imageUrl: _editProduct.imageUrl,
                      price: _editProduct.price,
                      id: _editProduct.id,
                      isFavorite: _editProduct.isFavorite,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValues['price'],
                  decoration: InputDecoration(labelText: 'السعر'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_descruptionFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'من فضلك ادخل السعر';
                    }
                    if (double.tryParse(value) == null) {
                      return 'من فضلك ادخل رقم وليس حرف';
                    }
                    if (double.parse(value) <= 0) {
                      return 'pمن فضلك ادخل سعر اكبر من الصفر';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editProduct = Product(
                      title: _editProduct.title,
                      description: _editProduct.description,
                      imageUrl: _editProduct.imageUrl,
                      price: double.parse(value),
                      id: _editProduct.id,
                      isFavorite: _editProduct.isFavorite,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValues['description'],
                  decoration: InputDecoration(labelText: 'الوصف'),
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  focusNode: _descruptionFocusNode,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'منفضلك ادخل الوصف';
                    }
                    if (value.length < 10) {
                      return 'منفضلك يجب ان يكون الوصف اكبر من 10 حروف';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editProduct = Product(
                      title: _editProduct.title,
                      description: value,
                      imageUrl: _editProduct.imageUrl,
                      price: _editProduct.price,
                      id: _editProduct.id,
                      isFavorite: _editProduct.isFavorite,
                    );
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      margin: EdgeInsets.only(top: 8, right: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: _imageUrlController.text.isEmpty
                          ? Text('Enter a URL')
                          : FittedBox(
                        child:
                        Image.network(_imageUrlController.text),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        // initialValue: _initValues['imageUrl'],
                        decoration:
                        InputDecoration(labelText: 'Image URL'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocusNode,
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'pleas enter  an image URL .';
                          }
                          if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return 'pleas enter a valid URL .';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editProduct = Product(
                            title: _editProduct.title,
                            description: _editProduct.description,
                            imageUrl: value,
                            price: _editProduct.price,
                            id: _editProduct.id,
                            isFavorite: _editProduct.isFavorite,
                          );
                        },
                      ),
                    ),
                  ],
                ),

                _image != null
                    ? Image.file(
                  _image,
                  height: 150,
                )
                    : Container(height: 150),
                _image == null
                    ? RaisedButton(
                  child: Text('Choose File'),
                  onPressed: chooseFile,
                  color: Colors.cyan,
                )
                    : Container(),
                _image != null
                    ? RaisedButton(
                  child: Text('Upload Image'),
                  onPressed: uploadFile,
                  color: Colors.cyan,
                )
                    : Container(),

                Container(),
                Text('Uploaded Image'),
                _uploadedFileURL != null
                    ? Image.network(
                  _uploadedFileURL,
                  height: 150,
                )
                    : Container(),
              ],
            )),
      ),
    );
  }

  File _image;
  String _uploadedFileURL;


  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }
  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('img/${Path.basename(_image.path)}}');

    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print(_image.path);
    print('Image Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
      print(_uploadedFileURL);
    });
  }
}
