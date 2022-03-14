import 'package:flutter/material.dart';

class ressourceForm extends ChangeNotifier{
  String? title;
  String? description;
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

  List<int>? get getRelationshipsID{
    return this.relationshipsID;
  }
  set setRelationshipsID(List<int> relationshipsID) {
    this.relationshipsID = relationshipsID;
    notifyListeners();
  }



}