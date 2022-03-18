import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import '../../helpers/apiHelper.dart';
import '../../helpers/fileHelper.dart';

class Ressource {

  late int id;
  late String label;
  late String? description;
  late String categoryID;
  late String relationships;
  late String? url;
  late PlatformFile? file;

  create() async{
    if(this.file != null){
      //Récup du lien signé pour l'upload sur AWS S3
      var firstUploadStep = await fileHelper.getSignedURL(this.file);
      String uploadURL = firstUploadStep.data["signedRequest"];
      this.url = firstUploadStep.data["url"];
      if(this.url == "" || this.url == null){
        print("Upload ERROR");
        return -1;
      }
      var secondUploadStep = await fileHelper.upload(this.file, uploadURL);
      if(!secondUploadStep){
        print("Upload ERROR");
        return -2;
      }

    }

    final response = await http.post(Uri.parse(API.getUrlWithRoute("ressources")),
        headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "label": label,
          "categoryID" : categoryID,
          "relationships" : relationships,
          "url" : url,
          "description" : description,
        },
    );

    return response.body;
  }



}