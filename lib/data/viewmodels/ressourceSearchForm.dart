import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:skidressourcesrel/data/models/ressource.dart';
import '../../helpers/fileHelper.dart';

class ressourceSearchForm extends ChangeNotifier{
  String searchTerm = "";
  String? categoryID;


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
    notifyListeners();
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