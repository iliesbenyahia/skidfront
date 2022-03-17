import 'package:flutter/material.dart';

class ressourceForm extends ChangeNotifier{
  String title = "";
  String description = "";
  String url = "";
  String filename = "";

  int? categoryID;
  //String? categoryLabel;
  List<int> relationshipsID = [];

  String? get getTitle {
    return this.title;
  }
  set setTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  String? get getFilename {
    return this.filename;
  }
  set setFilename(String filename) {
    this.filename = filename;
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

  set setUrl(String url) {
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
    this.title = "";
    this.filename = "";
    this.description = "";
    this.url = "";
    this.categoryID = null;
    this.relationshipsID = [];
  }


  isSendable(){
    bool sendable = true;
    if(this.title.isEmpty){
      sendable = false;
    }
    if(this.categoryID == null){
      sendable = false;
    }
    if(relationshipsID.length == 0){
      sendable = false;
    }
    return sendable;
  }


}