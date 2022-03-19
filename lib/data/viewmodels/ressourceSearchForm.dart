import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:skidressourcesrel/data/models/ressource.dart';
import '../../helpers/fileHelper.dart';
import '../../data/models/category.dart';

class ressourceSearchForm extends ChangeNotifier{
  String searchTerm = "";
  List<Map<String, dynamic>> categories = [];
  String? categoryID = "";
  List<Ressource> ressourcesCollection = [];


  String? get getSearchTerm {
    return this.searchTerm;
  }
  set setSearchTerm(String searchTerm) {
    this.searchTerm = searchTerm;
    notifyListeners();
  }


  String? get getCategoryID {
    return this.categoryID;
  }

  set setCategoryID(String categoryID) {
    this.categoryID = categoryID;
    fetchRessourcesCollection();
    notifyListeners();

  }

  set setRessourcesCollection(List<Ressource> ressourcescollec){
    this.ressourcesCollection = ressourcescollec;
    notifyListeners();
  }

  Future<List<Ressource>> fetchRessourcesCollection() async{
    List<Ressource> ressourcesCollection = [];
    if(categoryID != null && categoryID!.isNotEmpty) {
      ressourcesCollection = await Ressource.fetchRessourcesOfCategory(categoryID!);
    }
    return ressourcesCollection;
  }



  clearForm(){

  }

  submit() async{
    if(isSubmittable()){



    }
    else{
      //Message d'erreur ?
    }

  }

   isSubmittable(){
    bool sendable = true;
    return sendable;
  }


}