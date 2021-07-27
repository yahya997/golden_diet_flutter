import 'package:flutter/cupertino.dart';

class PageModel {
  int _id;
  String  _title, _description, _image;

  PageModel(this._id,this._title, this._description, this._image);


  int get id => _id;

  get image => _image;

  get description => _description;

  String get title => _title;
}