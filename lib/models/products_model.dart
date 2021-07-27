/// products : [{"id":0,"name":"product1","price":"82.12","image":"https://picsum.photos/250?image=9"},{"id":1,"name":"product2","price":"82.12","image":"https://picsum.photos/250?image=9"},{"id":2,"name":"product3","price":"82.12","image":"https://picsum.photos/250?image=9"},{"id":3,"name":"product4","price":"82.12","image":"https://picsum.photos/250?image=9"},{"id":4,"name":"product5","price":"82.12","image":"https://picsum.photos/250?image=9"}]

class ProductsModel {
  List<Products>? _products;

  List<Products>? get products => _products;

  ProductsModel({
      List<Products>? products}){
    _products = products;
}

  ProductsModel.fromJson(dynamic json) {
    if (json["products"] != null) {
      _products = [];
      json["products"].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_products != null) {
      map["products"] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 0
/// name : "product1"
/// price : "82.12"
/// image : "https://picsum.photos/250?image=9"

class Products {
  int? _id;
  String? _name;
  String? _price;
  String? _image;

  int? get id => _id;
  String? get name => _name;
  String? get price => _price;
  String? get image => _image;

  Products({
      int? id, 
      String? name, 
      String? price, 
      String? image}){
    _id = id;
    _name = name;
    _price = price;
    _image = image;
}

  Products.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _price = json["price"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["price"] = _price;
    map["image"] = _image;
    return map;
  }

}