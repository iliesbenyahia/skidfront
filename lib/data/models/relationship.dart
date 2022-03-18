import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../helpers/apiHelper.dart';

class Relationship {

  late int id;
  late String label;
  late String? description;
  late int categoryID;
  late List<int> relationships;
  late String url;

  /*
  create(String label, int categoryID, List<int> relationships, String url, String description) async{
    this.label = label;
    this.categoryID = categoryID;
    this.relationships = relationships;
    this.url = url;
    this.description = description;
    final response = await http.post(Uri.parse(API.getUrlWithRoute("relationship")),
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
  } */

  //Return string of relationships from API Call, needs to be converted
  static Future<List<Map<String, dynamic>>> fetchAllRelationships() async {

    List<Map<String, dynamic>> categs = [];

    late String? data;
    final response = await http
        .get(Uri.parse(API.getUrlWithRoute("relationships")));
    if (response.statusCode == 200) {
      data = response.body;
      var jsondata = json.decode(data);
      //print(jsondata.runtimeType);
      if (data != null) {
        for (var categ in jsondata) {
          categs.add({
            'value': categ["id"],
            'label': categ['label']
          });
        }
      }
    } else {
      throw Exception('Failed to fetch categories');
    }
    return categs;
  }


}