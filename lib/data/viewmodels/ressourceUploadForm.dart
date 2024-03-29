import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:skidressourcesrel/data/models/ressource.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../helpers/fileHelper.dart';

class ressourceForm extends ChangeNotifier{
  String title = "";
  String description = "";
  String url = "";
  String filename = "";
  double progressPercent = 0;
  bool isCreating = false;
  PlatformFile? file;

  String? categoryID;
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

  set setProgessPercent(double progressPercent){
    this.progressPercent = progressPercent;
    print("setProgress");
    print(this.progressPercent);
    notifyListeners();

  }

  int get getProgressPercent{


    print("getProgress");
    print(this.progressPercent);
    return progressPercent.toInt();
  }

  set setFile(PlatformFile file){
      this.file = file;
      this.filename = file.name;
      print(file.extension);
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

  String? get getCategoryID {
    return this.categoryID;
  }

  set setCategoryID(String categoryID) {
    this.categoryID = categoryID;
    notifyListeners();
  }

  String get getUrl {
    return this.url;
  }

  set setUrl(String url) {
    if(url != null) {
      this.url = url;
    }
    notifyListeners();
  }

  bool get getIsCreating {
    return this.isCreating;
  }

  set setIsCreating(bool isCreating) {
    this.isCreating = isCreating;
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

  submit({required BuildContext context, ProgressDialog? processDialog}) async{
    if(isSubmittable()){
      this.setIsCreating = true;
      Ressource futureRessource = new Ressource();
      futureRessource.file = this.file;
      if(file != null) {
        futureRessource.filename = this.file!.name;
      }
      futureRessource.label = this.title;
      futureRessource.categoryID = this.categoryID!;
      futureRessource.relationships = json.encode(this.relationshipsID) ;
      futureRessource.description = this.description;
      futureRessource.url = this.url;
      var ressourceid = await futureRessource.create(processDialog);
      Navigator.pushNamed(context, '/ressource', arguments : futureRessource);
      this.setIsCreating = false;

    }
    else{
      //Message d'erreur ?
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