

class PageModel {
  final String _title;
  final String _description;
  final String _image;


  PageModel(
    this._title,
    this._description,
    this._image,
    
  );

  String get image => _image;
  String get title => _title;
  String get description => _description;
 

}