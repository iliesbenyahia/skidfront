import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:skidressourcesrel/data/models/ressource.dart';
import 'package:skidressourcesrel/screens/ressource.dart';
import '../../helpers/fileHelper.dart';
import '../../data/models/category.dart';

class ressourceCard extends ChangeNotifier{
  Ressource? ressource;


  Ressource? get getRessource {
      return this.ressource;
  }

  set setRessource(Ressource? ressource) {
      this.ressource = ressource;
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

  addToFav() async{
    await this.ressource!.addToFavourite();
    notifyListeners();
  }

  removeFromFav() async{
    await this.ressource!.removeFromFavourite();
    notifyListeners();
  }

}