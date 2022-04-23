import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skidressourcesrel/screens/ressource.dart';
import '../../helpers/apiHelper.dart';
import '../../helpers/fileHelper.dart';
import '../../data/models/relationship.dart';
import '../../data/models/category.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class Ressource {

  late int id;
  late String label;
  late String? description;
  late String categoryID;
  late String relationships;
  late String? url;
  late PlatformFile? file;
  late String? filename;
  late Category? category;
  late int? isFav = 0;
  List<Relationship> relationshipsArray = [];

  create(ProgressDialog? progressDialog) async{
    if(this.file != null){
      //Récup du lien signé pour l'upload sur AWS S3
      var firstUploadStep = await fileHelper.getSignedURL(this.file);
      String uploadURL = firstUploadStep.data["signedRequest"];
      this.url = firstUploadStep.data["url"];
      if(this.url == "" || this.url == null){
        print("Upload ERROR");
        return -1;
      }
      var secondUploadStep = await fileHelper.upload(uploadFile : this.file, uploadURL : uploadURL, progressDialog: progressDialog);
      if(!secondUploadStep){
        print("Upload ERROR");
        return -2;
      }

    }
    final pref = await SharedPreferences.getInstance();

    final response = await http.post(Uri.parse(API.getUrlWithRoute("ressources")),
        headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "label": label,
          "categoryID" : categoryID,
          "relationships" : relationships,
          "filename" : filename,
          "url" : url,
          "description" : description,
          "userid" : pref.getInt("uid").toString()
        },
    );

    return response.body;
  }



  static Future<List<Ressource>> fetchRessourcesOfCategory(String categoryID) async{
    print("la categ");
    print(categoryID);
    List<Ressource> resourcesCollection = [];
    final prefs = await SharedPreferences.getInstance();
    var url = "ressources/category/"+categoryID;

    if(prefs.get("uid") != null){
      url += "/" + prefs.get("uid").toString();
    }

    final response = await http.get(Uri.parse(API.getUrlWithRoute(url)),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    var data = response.body;
    var jsondata = json.decode(data);
    //print(jsondata);
    if (data != null) {
      for (var data in jsondata) {
          Ressource ressource = new Ressource();

          ressource.id = data["id"];
          ressource.label = data["label"];
          ressource.description = data["description"];
          ressource.url = data["url"];
          ressource.filename = data["filename"];
          ressource.isFav = data["isFav"];
          for(var relationship in data["Relationships"]){
            //print(relationship);
            Relationship rel = Relationship();
            rel.id = relationship["id"];
            rel.label = relationship["label"];
            ressource.relationshipsArray.add(rel);

          }
          resourcesCollection.add(ressource);


          print(data);

        //
      }
    }
    return resourcesCollection;
  }


  fetch(String id) async{
    final response = await http.get(Uri.parse(API.getUrlWithRoute("ressources/"+id)),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    var data = response.body;
    var jsondata = json.decode(data);

    //this.id = int.parse(jsondata["id"]);
    //this.label = "mdr";
   /* this.description = jsondata["description"];
    this.url = jsondata["url"];
    this.categoryID = jsondata["RessourceCategoryId"];
    */

  }

  addToFavourite() async {
    final prefs = await SharedPreferences.getInstance();
    var url = "ressources/fav";

    final response = await http.post(Uri.parse(API.getUrlWithRoute(url)),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "ressourceid": this.id.toString(),
        "userid" : prefs.getInt("uid").toString()
      }
    );
    this.isFav = 1;
  }

  removeFromFavourite() async {
    final prefs = await SharedPreferences.getInstance();
    var url = "ressources/fav";


    final response = await http.delete(Uri.parse(API.getUrlWithRoute(url)),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "ressourceid": this.id.toString(),
          "userid" : prefs.getInt("uid").toString()
        }
    );
    this.isFav = 0;
  }


}