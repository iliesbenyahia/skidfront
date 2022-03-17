import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../helpers/fileHelper.dart';

class ressourceForm extends ChangeNotifier{
  String title = "";
  String description = "";
  String url = "";
  String filename = "";
  PlatformFile? file;

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

  PlatformFile? get getFile{
    return this.file;
  }

  set setFile(PlatformFile file){
      this.file = file;
      this.filename = file.name;
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

  submit() async{
    if(isSubmittable()){
      if(this.file != null){
        if(await fileHelper.upload(this.file)){

        }
      }
    }
    else{
    }
  }

   isSubmittable(){
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