import 'package:flutter/material.dart';

class ressourceForm extends ChangeNotifier{
  String? title;
  String? description;
  String? url;

  int? categoryID;
  //String? categoryLabel;
  List<int>? relationshipsID;

  String? get getTitle {
    return this.title;
  }
  set setTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  String? get getDescription {
    return this.description;
  }
  set Description(String description) {
    this.description = description;
    notifyListeners();
  }

  int? get getCategoryID {
    return this.categoryID;
  }

  set setCategoryID(int categoryID) {
    this.categoryID = categoryID;
    notifyListeners();
  }

  String? get getUrl {
    return this.url;
  }

  set setUrl(String? url) {
    this.url = url;
    notifyListeners();
  }

  List<int>? get getRelationshipsID{
    return this.relationshipsID;
  }
  set setRelationshipsID(List<int> relationshipsID) {
    this.relationshipsID = relationshipsID;
    notifyListeners();
  }


  clearForm(){
    this.title = null;
    this.description = null;
    this.url = null;
    this.categoryID = null;
    this.relationshipsID = null;
  }

  test(){
    print(this.description);
  }

}