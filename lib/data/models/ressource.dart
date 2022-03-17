import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import '../../helpers/apiHelper.dart';
import '../../helpers/fileHelper.dart';

class Ressource {

  late int id;
  late String label;
  late String? description;
  late int categoryID;
  late List<int> relationships;
  late String? url;
  late PlatformFile? file;

  create() async{

    fileHelper.upload(this.file)
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
  }



}